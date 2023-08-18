#include <bits/stdc++.h>
#include <SWI-Prolog.h>
#include <SWI-Stream.h>
#include <SWI-cpp.h>

std::string player;
std::map<std::vector<std::string>, std::pair<int, int>> table;
/*
    command line arguments
    [game prolog file] [player name] [depth]
*/ 

bool role_ok() {
    PlTermv av(1);
    PlQuery q("role", av);
    std::set<std::string> role;
    try {
        while(q.next_solution() ) {    
            role.insert(std::string((char *) av[0]));
        }
    } catch ( PlException &ex ) { 
        std::cerr << (char *) ex << std::endl;
    }

    return ((int) role.size() == 2) && (role.find(player) != role.end()); 
}

std::vector<std::vector<std::string>> get_legal() {
    PlTermv av(2);
    PlQuery q("legal", av);
    std::set<std::string> our, other;
    std::vector<std::vector<std::string>> result;
    while(q.next_solution() ) {    
        if (strcmp((char *) av[0], player.c_str()) == 0) {
            our.insert((char *) av[1]);
        } else {
            other.insert((char *) av[1]);
        }
    }

    for (auto &s : our) {
        for (auto &t : other) {
            std::vector<std::string> ret;
            std::string mv = std::string("does(").append(s).append(")");
            ret.push_back(mv);
            mv = std::string("does(").append(t).append(")");
            ret.push_back(mv);
            result.push_back(ret);
        }
    }
    
    return result;
}

bool is_terminal() {
    PlTermv av(0);
    PlQuery q("terminal", av);
    while (q.next_solution()) return true;
    return false;
}

int get_reward() {
    PlTermv av(2);
    PlQuery q("goal", av);
    int curr = -1;
    try {
        while (q.next_solution()) {
            if (strcmp((char *) av[0], player.c_str()) == 0) {
                curr = atoi((char *) av[1]);
                break;
            }
        }
    } catch ( PlException &ex ) { 
        std::cerr << (char *) ex << std::endl;
    }

    if (curr == -1) {
        exit(1);
    }
    return curr;
}

std::vector<std::string> query_next() {
    std::vector<std::string> result;
    std::set<std::string> st;
    std::cout << "enter query next" << std::endl;
    PlTermv av(1);
    PlQuery q("next", av);
    
    try {
        while (q.next_solution()) {
            std::string curr = std::string("true(").append(std::string((char *) av[0])).append(")");
            st.insert(curr);
        }
    } catch ( PlException &ex ) { 
        std::cerr << (char *) ex << std::endl;
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
            std::string curr = std::string("true(").append(std::string((char *) av[0])).append(")");
            st.insert(curr);
        }
    } catch ( PlException &ex ) { 
        std::cerr << (char *) ex << std::endl;
    }    

    for (auto &s : st) result.push_back(s);

    return result;
}

void add_facts(std::vector<std::string> &facts) {
    for (auto &s : facts) {
        std::string res = "assertz(";
        res.append(s);
        res.append(")");
        PlCall(res.c_str());
    }
}

void remove_facts(std::vector<std::string> &facts) {
    for (auto &s : facts) {
        std::string res = "retractall(";
        res.append(s);
        res.append(")");
        PlCall(res.c_str());
    }
}

int minimax(int depth, std::vector<std::string> &s_true) {
    add_facts(s_true);
    auto result = get_legal();
    for (auto &ss : result) {
        std::cout << ss[0] << " " << ss[1] << std::endl;
    }
    remove_facts(s_true);
    return 0;
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        std::cout << "Usage: ./minimax_solver [game prolog file] [player name] [depth]" << std::endl;
    }

    PL_initialise(2, argv);
    int depth = atoi(argv[3]);
    player = std::string(argv[2]);
    // game description is invalid
    if (!role_ok()) {
        printf("%s is not a role or the game is not a 2-player game\n", player.c_str());
        exit(1);
    }

    auto s_init = query_init();
    std::cout << (minimax(depth, s_init) ? "SAT" : "UNSAT") << std::endl;
    std::cout << "Terminal: " << is_terminal() << std::endl;
    printf("Transposition table size: %d\n", (int) table.size());
    // PL_cleanup(0);
    PL_halt(0);
    return 0;
}