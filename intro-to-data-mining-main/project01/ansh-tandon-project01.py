import socket
print(socket.gethostname())


import pandas as pd
df = pd.read_csv('/anvil/projects/tdm/data/flights/subset/1991.csv')

df[df["Month"]==12].head() # see information about a few of the flights from December 1991


# calculate memory (in bytes) on anvil A sub-cluster using Python
1000*256*1000000000

# calculate memory (in TB) on anvil A sub-cluster using Python
1000*256*0.001