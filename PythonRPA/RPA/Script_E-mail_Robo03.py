

# https://www.melhorcambio.com/dolar-hoje
#
#
#
# import smtplib
# from email.mime.multipart import MIMEMultipart
# from email.mime.text import MIMEText
#
#
# #texto do email
# texto_email =   ''
#
# # email remetente, senha, destinatário
# de = 'cursorpapython@gmail.com'
# senha = '**********'
# para = 'cursorpapython@gmail.com'
# #para02 = ''
#
# # Setup the MIME
# message = MIMEMultipart()
# message['From'] = de
# message['To'] = para
# #message['To'] = para02
# message['Subject'] = 'Cotação do dolar'   #Título do e-mail
#
# # Corpo do E-mail com anexos
# message.attach(MIMEText(texto_email, 'plain'))
#
# # Create SMTP session for sending the mail
# session = smtplib.SMTP('smtp.gmail.com', 587)  # Usuário do Gmail com porta
# session.starttls()  # Habilita a segurança
# session.login(de, senha)  # Login e senha de quem envia o e-mail
# texto = message.as_string()
# session.sendmail(de, para, texto)
# session.quit()