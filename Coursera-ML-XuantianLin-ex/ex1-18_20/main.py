def mkDateSet(datPath):
    dataSet = open(datPath, 'r').readlines()
    m = len(dataSet)
    X_train = np.zeros((m, 4))
    Y_train = np.zeros((m, 1))

    for i, item in enumerate(dataSet):
        each = item.strip().split()
        X_train[i] = [float(a) for a in each[:-1]]
        Y_train[i] = int(each[-1])
    X_train = np.hstack((np.ones((m, 1)), X_train))
    return (X_train, Y_train)


def sign(w, x):
    r = np.dot(w, x)
    if np.dot(w, x)[0] > 0:
        return 1
    else:
        return -1


def plaNaive(dataSet):
    (X, Y) = dataSet
    (m, n) = X.shape
    w = np.zeros((n, 1))
    errtimes = 0
    iters = 0
    while True:
        iters += 1  # 所需遍历data的次数
        hasError = False
        for t in range(m):
            if sign(X[t], w) != Y[t][0]:  # 发现错误点，进行一次梯度更新
                w = w + Y[t][0] * np.transpose([X[t]])
                # narray行向量x转置成列向量用np.transpose([x])。或者统一用matrix类，np.matrix(x).T
                errtimes += 1
                hasError = True
        if hasError == False:  # 直到某个w在所有样本上都分类正确，才停止
            break
    return w, iters, errtimes


def plaRandom(dataSet, repeat, ita):
    (X, Y) = dataSet
    (m, n) = X.shape
    w = np.zeros((n, 1))
    errnum = 0
    aveerrornum = 0
    for i in range(repeat):
        circle = random.sample(range(m), m)  # 每次试验选用相同的随机序列
        while True:
            hasError = False
            for t in circle:
                if sign(X[t], w) != Y[t][0]:
                    w = w + ita * Y[t][0] * np.transpose([X[t]])
                    errnum += 1
                    hasError = True
            if hasError == False:  # 直到某个w在所有样本上都分类正确，才停止一次实验
                break
        aveerrornum += errnum
        aveerrornum /= repeat
    return w, aveerrornum


def plaPocket(dataSet, testSet, updates, ita):
    (X, Y) = dataSet
    (m, n) = X.shape
    w = np.zeros((n, 1))
    bestw = np.zeros(w.shape)
    i = 0
    minerror = 1  # 初始的最小错误率
    while i < updates:
        t = random.randint(0, m - 1)  # 每次随机找一个点
        if sign(X[t], w) != Y[t][0]:
            w = w + ita * Y[t][0] * np.transpose([X[t]])
            errort = testW(w, dataSet)
            if errort < minerror:
                minerror = errort
                bestw = w
            i += 1  # 只查找50个错误点
    return bestw, minerror


def testW(w, dataSet):
    (X, Y) = dataSet
    m = len(X)
    errors = 0.0
    for t in range(m):
        if sign(X[t], w) == Y[t][0]:
            continue
        else:
            errors += 1
    errorrate = errors / m
    return errorrate


if __name__ == '__main__':
    dataSet1 = mkDateSet('hw1_15_train.dat')
    dataSet2 = mkDateSet('hw1_18_train.dat')
    testSet2 = mkDateSet('hw1_18_test.dat')
    # errtimes = plaNaive(dataSet1)[2] #第15题
    # errtimes = plaRandom(dataSet1,2000,0.5)[1] #第16/17题
    ##########第18题###########
    errorrate = 0.0
    for i in range(2000):
        bestw = plaPocket(dataSet2, testSet2, 50, 0.5)[0]
        errorrate += testW(bestw, testSet2)
        print(i)
    errorrate /= 2000
    print(errorrate)  # 0.1328509999999997
    #########第19题###########
    # 将plaPocket返回的bestw 改为 w
    # 0.352
    #########第20题###########
    # 将18题的updates=100
    # errorrate = 0.11495600000000031
————————————————
版权声明：本文为CSDN博主「海绵酱」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/zyghs/java/article/details/78701029