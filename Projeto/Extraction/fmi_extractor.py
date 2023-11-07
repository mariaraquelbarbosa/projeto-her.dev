import requests
import pandas as pd

class FMIDataset:
    """This class represents datasets that can be extracted from the FMI API"""
    
    def __init__(self, database_id):
        self.database_id = database_id
        self.base_url = f"http://dataservices.imf.org/REST/SDMX_JSON.svc/CompactData/{self.database_id}"

    def joiners(self, *input_lists):
        joined_strings = tuple("+".join(input_list) for input_list in input_lists)
        return joined_strings

    def fetch_data(self, frequency, region, indicator):
        # Construct the full URL
        url = f"{self.base_url}/{frequency}.{region}.{indicator}"

        # Request data from the API
        response = requests.get(url).json()
        return response

    def process_data(self, response):
        
        # Access the 'Series' key to get the list of indicators
        indicadores = response['CompactData']['DataSet']['Series']

#         # Use list comprehensions to create the list of indicator dictionaries
        lista_indicadores = [
            {
                'Código do indicador': indicador['@INDICATOR'],
                'Localização': indicador['@REF_AREA'],
                'Período': obs.get('@TIME_PERIOD', None),
                'Valor': obs.get('@OBS_VALUE', None)
            }
            for indicador in indicadores
            for obs in indicador['Obs']
        ]


        # Create a DataFrame from the list of dictionaries
        df = pd.DataFrame(lista_indicadores)

        return df

    def get_indicator(self, frequency_list, region_list, indicator_list):
        frequency, region, indicator = self.joiners(frequency_list, region_list, indicator_list)
        response = self.fetch_data(frequency, region, indicator)
        df = self.process_data(response)
        return df