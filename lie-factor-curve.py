import math

pi = math.pi
r1 = 159.35
x = 54.7
vals = (245710, 230343, 226168, 223249, 207794)
exL = (208, 137.3, 117.34, 105.37, 33.33)

print("\nlengths of black segments", *exL, sep='\n')

curv = list()
for n in range(5):
    curv.append(round((pi*(r1 + n*x)+exL[n]), 2))
print("\ntotal lengths of curves", *curv, sep='\n')

RCinplot = list()
for a in range(4):
    RCinplot.append((curv[a]-curv[a+1])/curv[a+1])

RCindata = list()
for a in range(4):
    RCindata.append((vals[a]-vals[a+1])/vals[a+1])

print("\nLieFactor of consecutive pairs (considering complete curves)")
for a in range(4):
    lf = RCinplot[a]/RCindata[a]
    print(round(abs(lf), 2))

RCinlen = list()
for a in range(4):
    RCinlen.append((exL[a]-exL[a+1])/exL[a+1])

print("\nLieFactor of consecutive pairs (considering only black lengths)")
for a in range(4):
    lf = RCinlen[a]/RCindata[a]
    print(round(abs(lf), 2))

print("\nLieFactor in extremes")

LFcurv = round(abs(((curv[0]-curv[4])/curv[4])/((vals[0]-vals[4])/vals[4])), 2)
print("Complete Curve: ", LFcurv)

LFlen = round(abs(((exL[0]-exL[4])/exL[4])/((vals[0]-vals[4])/vals[4])), 2)
print("black length:", LFlen)
