import json
from pprint import pprint

class jsonparse(object):
	def __init__(self):
		 pass

	def getting_attributes_of_phones(self,path,device):
		self.path=path
		print path
		with open(path) as data_file:
			self.device=device
			self.data = json.load(data_file)
		for k,v in self.data.items():
			self.key=k
			print self.key
		self.device_attribute=self.data[self.key][self.device]
		return self.device_attribute

	def get_values_from_json(self,key):
		self.getting_attributes_of_phones()
		self.title=self.device_attribute[key]
		return self.title
