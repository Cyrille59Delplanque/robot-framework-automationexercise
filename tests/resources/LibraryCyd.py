from selenium.webdriver.remote.webelement import WebElement
from selenium.webdriver.common.by import By  # Importation de By
from SeleniumLibrary import SeleniumLibrary
from robot.libraries.BuiltIn import BuiltIn

class LibraryCyd:
    def __init__(self, seleniumlib=None):
        self.selib = BuiltIn().get_library_instance("SeleniumLibrary")
        self.dict_convert_to_By={
            "xpath": By.XPATH,
            "id": By.ID,
            "link": By.LINK_TEXT,
            "name": By.NAME,
            "class": By.CLASS_NAME,
            "css": By.CSS_SELECTOR,
            "tag": By.TAG_NAME
        }        
    
    def get_child_webelements(self, parent_element: WebElement,child: str):
        """
        This keyword finds all child WebElements within a parent WebElement using the provided XPath.
        
        :param parent_element: The WebElement that serves as the parent.
        :param type_of_find: the ID, Xpath... example By.XPATH
        :param child: to find the child WebElement.
        :return: The child WebElement if found.
        """

        type_of_find, child = child.split('=',1)
        
        try:
            if parent_element is None:
                raise RuntimeError("Parent element is None, cannot find child.")
            child_elements = parent_element.find_elements(self.dict_convert_to_By[type_of_find], child)
            return child_elements
        except Exception as e:
            raise RuntimeError(f"Failed to find child WebElement: {str(e)}")
        
    def get_child_webelement(self, parent_element: WebElement,child: str):
        """
        This keyword finds a child WebElement within a parent WebElement using the provided XPath.
        
        :param parent_element: The WebElement that serves as the parent.
        :param type_of_find: the ID, Xpath... example By.XPATH
        :param child: to find the child WebElement.
        :return: The child WebElement if found.
        """

        type_of_find, child = child.split('=')
        
        try:
            if parent_element is None:
                raise RuntimeError("Parent element is None, cannot find child.")
            child_elements = parent_element.find_element(self.dict_convert_to_By[type_of_find], child)
            return child_elements
        except Exception as e:
            raise RuntimeError(f"Failed to find child WebElement: {str(e)}")
        
    def get_css_property(self, locator, property_name): 
        try:
            driver = self.selib.driver
        except AttributeError:
            raise RuntimeError("Aucun navigateur ouvert. Veuillez utiliser 'Open Browser' avant d'exécuter ce mot-clé.")   
        element = self.selib.find_element(locator)        
        return element.value_of_css_property(property_name)