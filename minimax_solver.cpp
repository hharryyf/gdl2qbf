#include <bits/stdc++.h>
#include <SWI-Prolog.h>
#include <SWI-cpp2.h>
#include <SWI-cpp2.cpp>

std::string player;
std::map<std::vector<std::string>, std::pair<int, int>> table;
/*
    swipl-ld -goal true -o minimax_solver -ld g++ -g -O minimax_solver.cpp
    
    command line arguments
    ./minimax_solver [game prolog file] [player name] [depth]
*/ 
int cnt = 0, add_cnt = 0, remove_cnt = 0, iteration = 0;
bool role_ok() {
    PlTermv av(1);
    PlQuery q("role", av);
    std::set<std::string> role;
    try {
        while(q.next_solution() ) {    
            role.insert(av[0].as_string());
        }
    } catch ( PlExceptionBase &ex ) { 
        std::cerr << ex.what() << std::endl;
    }

    return ((int) role.size() == 2) && (role.find(player) != role.end()); 
}

std::tuple<std::vector<std::vector<std::string>>, int, int> get_legal() {
    PlTermv av(2);
    PlQuery q("legal", av);
    std::set<std::string> our, other;
    std::vector<std::vector<std::string>> result;
    std::string other_name;
    try {
        while(q.next_solution() ) {    
            if (av[0].as_string() ==player) {
                our.insert(av[1].as_string());
            } else {
                other.insert(av[1].as_string());
                other_name = av[0].as_string();
            }
        } 
    } catch ( PlExceptionBase &ex ) { 
        std::cerr << "in legal " << ex.what() << std::endl;
    }

    for (auto &s : our) {
        for (auto &t : other) {
            std::vector<std::string> ret;
            std::string mv = std::string("does(").append(player).append(", ").append(s).append(")");
            ret.push_back(mv);
            mv = std::string("does(").append(other_name).append(", ").append(t).append(")");
            ret.push_back(mv);
            result.push_back(ret);
        }
    }

    return std::make_tuple(result, (int) our.size(), (int) other.size());
}

bool is_terminal() {
    PlTermv av(0);
    PlQuery q("terminal", av);
    try {
        while (q.next_solution()) {
            return true;
        }
    } catch ( PlExceptionBase &ex ) { 
        std::cerr << "in terminal " << ex.what() << std::endl;
    }
    return false;
}

int get_reward() {
    
    int curr = -1;
    PlTermv av(2);
    PlQuery q("goal", av);
    try {
        while (q.next_solution()) {
            if (av[0].as_string() == player) {
                curr = atoi(av[1].as_string().c_str());
                break;
            }
            //std::cout << std::string((char *) av[0]) << " " << atoi((char *) av[1]) << std::endl;
        }
    } catch ( PlExceptionBase &ex ) { 
        std::cerr << "in reward " <<  ex.what() << std::endl;
    }


    if (curr == -1) {
        printf("bad\n");
        exit(1);
    }
    return curr;
}

std::vector<std::string> query_next() {
    std::vector<std::string> result;
    std::set<std::string> st;
    //std::cout << "enter query next" << std::endl;

    PlTermv av(1);
    PlQuery q("next", av);
    
    try {
        while (q.next_solution()) {
            std::string curr = std::string("true(").append(av[0].as_string()).append(")");
            st.insert(curr);
            //std::cout << curr << std::endl;
        }
    } catch ( PlExceptionBase &ex ) { 
        std::cerr << "in next " <<  ex.what() << std::endl;
    }    


    for (auto &s : st) result.push_back(s);

    return result;
}

std::vector<std::string> query_init() {
    std::vector<std::string> result;
    std::set<std::string> st;

    PlTermv av(1);
    PlQuery q("init", av);
    
    try {
        while (q.next_solution()) {
            std::string curr = std::string("true(").append(av[0].as_string()).append(")");
            st.insert(curr);
        }
    } catch ( PlExceptionBase &ex ) { 
        std::cerr << ex.what() << std::endl;
        exit(1);
    }    

    for (auto &s : st) result.push_back(s);

    return result;
}

void add_facts(std::vector<std::string> &facts) {
    for (auto &s : facts) {
        std::string res = "assertz(";
        res.append(s);
        res.append(")");
        try {
            //std::cout << "add fact " << res << std::endl;
            add_cnt++;
            PL_STRINGS_MARK();
            if (!PlCall(res)) {
                std::cerr << "Error Add!" << std::endl;
            }
            PL_STRINGS_RELEASE();
        } catch ( PlExceptionBase &ex ) { 
            std::cerr << "in add " << ex.what() << " " << res << std::endl;
            exit(1);
        }
        // std::cout << res << std::endl;
    }
}

void remove_facts(std::vector<std::string> &facts) {
    for (auto &s : facts) {
        std::string res = "retractall(";
        res.append(s);
        res.append(")");
        try {
            remove_cnt++;
            PL_STRINGS_MARK();
            //std::cout << "remove fact " << res << std::endl;
            if (!PlCall(res)) {
                std::cerr << "Error retract!" << std::endl;
            }
            PL_STRINGS_RELEASE();
        }
        catch ( PlException &ex ) { 
            std::cerr << "in remove " << ex.what() << " " << res << std::endl;
            exit(1);
        }
    }
}

int minimax(int depth, std::vector<std::string> &s_true, char *argv[]) {
    if (cnt > 20000) {
        cnt = 0;
        Plx_cleanup(1);
        Plx_initialise(2, argv);
    }
    add_facts(s_true);
    
    
    ++cnt;
    ++iteration;
    if (cnt % 1000 == 0) std::cout << iteration << " tt: " << table.size() << " " << add_cnt << " " << remove_cnt << " " << add_cnt - remove_cnt << std::endl;
    

    if (is_terminal()) {
        int rew = get_reward();
        
        remove_facts(s_true);
        
        // printf("reward = %d\n", rew);
        if (rew == 100) return 1;
        return 0;
    }

    if (table.find(s_true) != table.end()) {
        auto entry = table[s_true];
        if (entry.first >= depth || entry.second == 1) {
            
            remove_facts(s_true);
            
            return entry.second;
        }
    }

    if (depth == 0) {
        
        remove_facts(s_true);
        
        return 0;
    }

    auto legals = get_legal();
    auto legal_moves = std::get<0>(legals);
    auto x_sz = std::get<1>(legals);
    auto o_sz = std::get<2>(legals);
    
    remove_facts(s_true);
    
    int reward = -1;

    if (x_sz > 1 && o_sz > 1) { 
        printf("The game is not turn-taking\n");
        exit(1);
    }

    if (x_sz < 1 || o_sz < 1) {
        printf("Invalid game description, the game is not playable\n");
        exit(1);
    }

    if (o_sz == 1) {
        for (auto &move : legal_moves) {
            
            add_facts(move);
            add_facts(s_true);
            
            auto s_next = query_next();
            
            remove_facts(s_true);
            remove_facts(move);
            
            //std::cout << "perform " << move[0] << " " << move[1] << std::endl;
            if (reward == -1) {
                reward = minimax(depth - 1, s_next, argv);
            } else {
                reward = std::max(reward, minimax(depth - 1, s_next, argv));
            }
            
            if (reward == 1) break;
            //std::cout << "undo " << move[0] << " " << move[1] << std::endl;
        }
    } else {
        for (auto &move : legal_moves) {
            
            add_facts(move);
            add_facts(s_true);
            
            auto s_next = query_next();
            
            remove_facts(s_true);
            remove_facts(move);
            
            //std::cout << "perform " << move[0] << " " << move[1] << std::endl;
            if (reward == -1) {
                reward = minimax(depth - 1, s_next, argv);
            } else {
                reward = std::min(reward, minimax(depth - 1, s_next, argv));
            }
            
            if (reward == 0) break;
            //std::cout << "undo " << move[0] << " " << move[1] << std::endl;
        }
    }


    if ((int) table.size() <= 3000000) {
        if (table.find(s_true) == table.end()) {
            table[s_true] = std::make_pair(depth, reward);
        } else {
            if (reward == 1) {
                table[s_true] = std::make_pair(depth, reward);
            } else {
                auto entry = table[s_true];
                if (entry.first < depth) {
                    table[s_true] = std::make_pair(depth, reward);
                }
            }
        }
    }
    
    return reward;
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        std::cout << "Usage: ./minimax_solver [game prolog file] [player name] [depth]" << std::endl;
    }

    Plx_initialise(2, argv);
    int depth = atoi(argv[3]);
    player = std::string(argv[2]);
    // game description is invalid
    if (!role_ok()) {
        printf("%s is not a role or the game is not a 2-player game\n", player.c_str());
        exit(1);
    }

    auto s_init = query_init();
    std::cout << (minimax(depth, s_init, argv) ? "SAT" : "UNSAT") << std::endl;
    printf("Transposition table size: %d\n", (int) table.size());
    // PL_cleanup(0);
    PL_halt(0);
    return 0;
}