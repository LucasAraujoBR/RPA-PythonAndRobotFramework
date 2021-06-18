*** Settings ***
Documentation     Machine Learning API examples.
Library           RPA.FileSystem
Library           RPA.HTTP
Library           RPA.Tables
Library           RPA.Cloud.AWS
...               region=us-east-1
...               robocloud_vault_name=aws
Library           RPA.Cloud.Azure
...               region=eastus
...               robocloud_vault_name=azure
Library           RPA.Cloud.Google
...               robocloud_vault_name=gcp
...               robocloud_vault_secret_key=json_content

# variaveis
*** Variables ***
${INVOICE_URL}=    https://templates.invoicehome.com/invoice-template-us-neat-750px.png
${INVOICE_FILE}=    ${CURDIR}${/}output${/}invoice.png
${PICTURE_URL}=    https://upload.wikimedia.org/wikipedia/commons/9/9d/Beurer_BM26_sphygmomanometer.jpg
${PICTURE_FILE}=    ${CURDIR}${/}output${/}picture.jpg
${TEXT_SAMPLE}=    A software robot developer creates digital agents for robotic process
...               automation (RPA), test automation, application monitoring, or some
...               other use. Tens of thousands of new jobs are predicted to be created
...               in the RPA industry. Most of these will be for developers.
...               The demand for software robot developers is growing. Many companies
...               will employ teams of software robot developers to build and operate
...               their automated workforce. Other organizations hire external
...               developers to offer them automation with a 'robotics-as-a-service' model.

#A primeira tarefa é baixar as imagens de amostra:

*** Tasks ***
Download sample files
    Create Directory    ${CURDIR}${/}output    parents=True
    Download    ${INVOICE_URL}    target_file=${INVOICE_FILE}    overwrite=True
    Download    ${PICTURE_URL}    target_file=${PICTURE_FILE}    overwrite=True


# analise uma fatura digitalizada, usamos o serviço Textract da AWS. (AWS)

#*** Tasks ***
#Analyze invoice with AWS Textract and find tables from the response
#    Init Textract Client    use_robocloud_vault=True
#    ${response}=    Analyze Document    ${INVOICE_FILE}    ${CURDIR}${/}output${/}textract.json
#    ${tables}=    Get Tables
#    FOR    ${key}    IN    @{tables.keys()}
#        Write Table To Csv    ${tables["${key}"]}    ${CURDIR}${/}output${/}table_${key}.csv
#    END



#O uso de ( RPA.Cloud.Azure ) é demonstrado pelo serviço de análise de texto.
# Na tarefa a seguir,
# o robô reconhece o idioma, as frases-chave e o sentimento de um texto de amostra.

#*** Tasks ***
#Analyze text sample with Azure
#    Init Text Analytics Service    use_robocloud_vault=True
#    Detect Language    Vilken språk talar man in Åbo?    ${CURDIR}${/}output${/}text_lang.json
#    Key Phrases    ${TEXT_SAMPLE}    ${CURDIR}${/}output${/}text_phrases.json
#    Sentiment analyze    ${TEXT_SAMPLE}    ${CURDIR}${/}output${/}text_sentiment.json


# Em RPA.Cloud.Google experimentamos o Google Vision AI,
# que pode ser usado, por exemplo, para rotular uma imagem ou detectar o texto.

#*** Tasks ***
#Analyze image with Google Vision AI
#    Init Vision Client    use_robocloud_vault=True
#    ${labels}=    Detect Labels    ${PICTURE_FILE}    ${CURDIR}${/}output${/}vision_labels.json
#    ${text}=    Detect Text    ${PICTURE_FILE}    ${CURDIR}${/}output${/}vision_text.json
#    Log    ${CURDIR}