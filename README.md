# Overview:
  This python script will take as input a url to a json type file with the desired format.
  The script will then allow the user to explore the data by optionally filtering by class, type, and repo.
  The script will print the data to stdout and save it to a file named "data.json"
  Note that the script allows for combined criteria.

# Environment setup:
1. Run pip3 install -r requirements to install all dependencies

# Get started:
1. Simply run python3 cli.py [sourceUrl] [class] [type] [repo]

# Testing:
  There are 6 cases tested for:
  1. Tests the script with no arguments.
  2. Tests only with sourceUrl argument.
  3. Tests the class filter.
  4. Tests the repo filter.
  5. Tests the type filter.
  6. Tests the combination of class and type filter.
# To Run the Tests:
  1. Run chmod u+x test.sh to ensure you have execution access.
  2. Run ./test.sh
  
