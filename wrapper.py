import datetime
import logging
import json
import os

import papermill as pm
from flask import Flask, Response, request

app = Flask(__name__)

logging.getLogger().setLevel(logging.INFO)

@app.route('/health', methods=['GET'])
def health_check():
	status_code = Response(status=200)
	return status_code

@app.route('/api/<notebook>', methods=['POST'])
def add_message(notebook):
    logging.info("starting job")
    logging.info("Running Notebook " + notebook)

    content_type = request.headers.get('Content-Type')
    if (content_type == 'application/json'):
        logging.info("application/json content type")
        logging.info(request.data)


    content = json.loads(request.data)
    logging.info(content)
    logging.info(json.dumps(content))
    dtNow = datetime.datetime.now().strftime("%f")
    outputName = 'output-run-'+dtNow+'.json'
    nbOutput = notebook + dtNow + ".ipynb"
    nbInput = notebook + '.ipynb'
    parameters = {
        'input': content,
        'output': outputName
    }

    pm.execute_notebook(
        nbInput,
        nbOutput,
        parameters=parameters
    )

    # Opening JSON file
    f = open(outputName)
  
    # returns JSON object as 
    # a dictionary
    data = json.load(f)
  
    # Closing file
    f.close()

    # Clean up files
    if os.path.exists(nbOutput):
        os.remove(nbOutput)
    else:
        print("The Notebook output file does not exist")

    if os.path.exists(outputName):
        os.remove(outputName)
    else:
        print("The output file does not exist")

    logging.info("job completed")

    return data

if __name__ == '__main__':
    import os

    port = os.environ.get('PORT', '8080')
    app.run(port=port)
    logging.info("All running")