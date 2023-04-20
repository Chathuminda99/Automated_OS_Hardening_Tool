import sys
import time

def processing():
    while True:
        # for i in range(1, 4):
        #     sys.stdout.write('\rProcessing' + '.'*i)
        #     sys.stdout.flush()
        #     time.sleep(0.3)
        for i in range(2, 0, -1):
            sys.stdout.write('\rProcessing' + '.'*i)
            sys.stdout.flush()
            time.sleep(0.3)

def spinning_line():
    while True:
        for symbol in '|/-\\':
            sys.stdout.write('\rProcessing ' + symbol)
            sys.stdout.flush()
            time.sleep(0.15)

processing()

spinning_line()
