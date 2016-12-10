import csv      # csv module

def create_bar(value, max_value):
    percentage = 100 * value / max_value
    percentage = int(percentage);
    unit = percentage / 2
    bar = ''
    while 0 < unit:
        bar = bar + '#'
        unit -= 1
    bar = bar + ' ' + str(percentage) + '%'
    return bar

battery = open('../log/current_battery.csv', 'r')

dataReader = csv.reader(battery, delimiter=",", quotechar='"')
curren_date = ''
for row in dataReader:
    if curren_date != row[0] :
        curren_date = row[0];
        print (curren_date)
    print (row[1] + ' ' + create_bar(int(row[2]), 4400))


