'''
피보나치 수열 관련 함수(테스트 : python fibinacci.py 100)
'''

def fibo_print(n):
    'n미만의 피보나치 수열을 print (ex)0, 1, 1, 2, 3, 5, ...'
    a, b = 0, 1
    while a < n:
        print(a, end=' ')
        a, b = b, a+b
    print()

def fibo_return(n):
    'n미만의 피보나치 수열의 list 리턴'
    a, b = 0, 1
    result = []
    while a<n:
        result.append(a)
        a, b = b, a+b
    return result

if __name__ == '__main__':
    import sys
    #sys.argv : 명령행 인수
    if len(sys.argv) > 1:
        print('1. print test : ', end=' ')
        fibo_print(int(sys.argv[1]))
        lst = fibo_return(int(sys.argv[1]))
        print('2. return된 list test :', lst)
    else:
        print('1. print test : ', end=' ')
        fibo_print(100)
        lst = fibo_return(100)
        print('2. return된 list test :', lst)