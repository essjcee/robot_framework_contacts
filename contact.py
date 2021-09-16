import csv
import os
import sys
 
CONTACT_FILE = 'contacts.csv'
 
 
def add_contact(first_name, last_name):
    with open(CONTACT_FILE, 'a', newline='') as csv_file:
        writer = csv.writer(csv_file, delimiter=',', quotechar='"', quoting=csv.QUOTE_ALL)
        writer.writerow([first_name, last_name])
 
 
def list_contacts():
    contacts_list = []
    if os.path.exists(CONTACT_FILE):
        with open(CONTACT_FILE, newline='') as csv_file:
            reader = csv.reader(csv_file, delimiter=',', quotechar='"')
 
            for row in reader:
                contacts_list.append(' '.join(row))
 
    print(contacts_list)
 
 
def remove_all_contacts():
    if os.path.exists(CONTACT_FILE):
        os.remove(CONTACT_FILE)
    else:
        print("The file does not exist")
 
 
if __name__ == '__main__':
    actions = {'add_contact': add_contact,
               'list_contacts': list_contacts,
               'remove_all_contacts': remove_all_contacts}
 
    action = sys.argv[1]
    args = sys.argv[2:]
    actions[action](*args)