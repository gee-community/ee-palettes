from glob import glob
import os
import pprint
import pandas as pd

path='../../../fcrameri/ScientificColourMaps5/[!+]*'

# 

files = glob(path)

def palette2js(path):
    name = os.path.basename(path)

    color_counts = [10, 25, 50]

    def parse_single(count):
        path_gpl = path + '/CategoricalPalettes/' + name + '_' + str(count) + '.gpl'
        df=pd.read_csv(path_gpl, skiprows=4, header=None, delimiter="\s+") 
        colors = ['\'' + o[1:] + '\'' for o in list(df[4])]

        return '  ' + str(count) + ': [' + ','.join(colors) + ']'
   
    palette = name + ': {\n' + ',\n'.join(list(map(parse_single, color_counts))) + '\n}'

    return palette
    
palettes = map(palette2js, files)

print(',\n'.join(palettes))