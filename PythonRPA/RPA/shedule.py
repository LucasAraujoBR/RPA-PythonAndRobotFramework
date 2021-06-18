import schedule
import time
from roboTest import botRoboTest


print('Processando...')
schedule.every(1).minutes.do(botRoboTest)
# schedule.every().hour.do(job)
#schedule.every().day.at("23:42").do(botRoboTest)
# schedule.every(5).to(10).minutes.do(job)
# schedule.every().monday.do(job)
# schedule.every().wednesday.at("13:15").do(job)
# schedule.every().minute.at(":37").do(botRoboTest)

while True:
    schedule.run_pending()
    time.sleep(1)