import pandas as pd
from apyori import apriori

def run(cName,cType):
    store_data = pd.read_csv('app1/AkshatComputerWithCompany.csv',header=None)
    maxlen=len(store_data.index)
    print(store_data.head())
    records=[]
    records1 = []
    records2=[]
    dic={}
    for i in range(maxlen):
        records.append([str(store_data.values[i,j]) for j in range(6,len(store_data.columns)) if str(store_data.values[i,j])!='nan' ])

    print(records)        
    def apriorial(r):
        association_rules = apriori(r,min_support=0.05,min_confidence=0.05,min_lift=1,min_length=2,max_length=None)
        association_results = list(association_rules)
        print(association_results,"\n\n")

        for item in association_results:

            print(list(item[0]))
            print("Rule: " + str(list(item[2][0][0])) + " -> " + str(list(item[2][0][1])))
            print("Support: " + str(item[1]))
            print("Confidence: " + str(item[2][0][2]))
            print("Lift: " + str(item[2][0][3]))
            print("*****************************\n")
            dic[str(list(item[2][0][0]))]=str(list(item[2][0][1]))

    apriorial(records)
    print(dic)
   
    com= cName
    flag=0
    for i in range(maxlen):    
        if str(store_data.values[i][1])==com:
            records1.append([str(store_data.values[i, j]) for j in range(6,len(store_data.columns)) if str(store_data.values[i,j])!='nan' ])
            flag=1    
    if flag==0:
        sec= cType
        for i in range(maxlen):
            if str(store_data.values[i,2])==sec:
                records2.append([str(store_data.values[i, j]) for j in range(6,len(store_data.columns)) if str(store_data.values[i,j])!='nan' ]) 
        print(records2)
        apriorial(records2)
    else:
        apriorial(records1)

    return dic














































