import requests
import argparse
import os.path
import json


parser = argparse.ArgumentParser()
#all the optional arguments
parser.add_argument("--sourceUrl", help="input the source url of the json file.")
parser.add_argument("--class", help="input the class name.")
parser.add_argument("--type", help="input the type of vulnerability")
parser.add_argument("--repo", help="input the repository.")
args = parser.parse_args()
args_dic = vars(args)   #convert to dictionary (avoid error with "class")

if(args.sourceUrl==None): #if sourceUrl has no input, print a message
    print("Please input a sourceUrl.")
    exit(2)
else:
    url = args.sourceUrl
    r = requests.get(url)# get the file from the url
    json_dict = r.json()    #convert json file
    if(args_dic["class"]!=None):

        for key in list(json_dict["data"][0]):
            if(key!=args_dic["class"]): #if entry's input is not equal to user class input
                del json_dict["data"][0][key]
    if(args_dic["type"]!=None):

        for key in list(json_dict["data"][0]):  #for all the classes
            findings = json_dict["data"][0][key]['findings']
            findings[:] = [x for x in findings if x['type']==args_dic["type"]]  #keep only classes with specified type
            if not findings:    #if some list is empty
                del json_dict["data"][0][key] #delete



    if(args_dic["repo"]!=None):

        for key in list(json_dict["data"][0]):
            findings = json_dict["data"][0][key]['findings']
            findings[:] = [x for x in findings if  os.path.dirname(x['location'])==args_dic["repo"]] #keep only entries with filepath matching the input
            if not findings:
                del json_dict["data"][0][key]

    finalFormat= []
    for key in list(json_dict["data"][0]):
        findings = json_dict["data"][0][key]['findings']
        for element in findings:
            dict ={
            "repository": os.path.dirname(element['location']),
            "file": os.path.split(element['location'])[1],
            "startLineNumber": element["startLineNumber"],
            "end": element["endLineNumber"],
            "class": key,
            "type": element["type"]
            }
            finalFormat.append(dict)


    with open('data.json', 'w') as json_file:
        json_file.write(json.dumps(finalFormat,  indent=4, separators=(',', ': '))) #save json to file in readable format
        print(json.dumps(finalFormat, indent=4, separators=(',', ': '))) #print json in readable format
