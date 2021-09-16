""" Robot Framework library for the Contact application.
This library contains several entry points for accessing and testing the Python Contact script
"""
from robot.api.deco import keyword
import subprocess

ROBOT_LIBRARY_VERSION = '0.1'
ROBOT_AUTO_KEYWORDS = False

@keyword
def clear_contacts_list(application_path):
    """
    Clear the list of contacts.
    Arguments:
    - ''application_path:''     The relative (or absolute) path where the Contact script resides\n
    Examples:
    Clear Contacts List	../contact.py
    """
    subprocess.run(['python', application_path, 'remove_all_contacts'], check=True)


@keyword
def retrieve_contacts_list(application_path):
    """
    Retrieve the list of contacts.
    Arguments:
    - ''application_path:''     The relative (or absolute) path where the Contact script resides\n
    Examples:
    Retrieve Contacts List	../contact.py
    """
    process = subprocess.run(['python', application_path, 'list_contacts'], check=True, stdout=subprocess.PIPE, text=True)
    result = process.stdout.rstrip('\n')
    return result


@keyword
def add_contact(application_path, first_name, last_name):
    """
    Add an contact.
    Arguments:
    - application_path:	The relative (or absolute) path where the Contact script resides
    - first_name:		The first name of the contact to be added.
    - last_name:		The last name of the contact to be added.
    Examples:
    Add Contact ../contact.py Phil	Jones
    """
    subprocess.run(['python', application_path, 'add_contact', first_name, last_name], check=True)

