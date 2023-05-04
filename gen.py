for i in range(1, 32):
    for j in range(0, 5):
        if ((i >> j) & 1) == 1:
            if j == 5:
                print('moveL' + '(' + 'oplayer, ' + str(j+1) + ', T' + ').')
            else:
                print('moveL' + '(' + 'oplayer, ' + str(j+1) + ', T' + '), ', end='')
        else:
            if j == 5:
                print('not moveL' + '(' + 'oplayer, ' + str(j+1) + ', T' + ').')
            else:
                print('not moveL' + '(' + 'oplayer, ' + str(j+1) + ', T' + '), ', end='')
    print()