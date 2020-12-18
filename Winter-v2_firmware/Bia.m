%%
%IO
clc
clear
modZ = 465.35;
phiZ = -10.31;

R = modZ*cos(deg2rad(phiZ));
Xc = modZ*sin(deg2rad(phiZ));

Ht = 175;
Wt = 65;

FFM1 = -4.104 + 0.518 * (((Ht)^2)/R) + 0.231 * Wt + 0.130 * Xc + 4.229;

FM1 =  14.94 - 0.079 * (((Ht)^2)/R) + 0.818 * Wt - 0.231 * Ht - (0.064 * 1 * Wt) + 0.077 * 24;


%%
%DAD
clc
clear
modZ = 371.60;
phiZ = 6.85;

R = modZ*cos(deg2rad(phiZ));
Xc = modZ*sin(deg2rad(phiZ));



Ht = 172;
Wt = 78;

FFM2 = -4.104 + 0.518 * (((Ht)^2)/R) + 0.231 * Wt + 0.130 * Xc + 4.229;
FM2 =  14.94 - 0.079 * (((Ht)^2)/R) + 0.818 * Wt - 0.231 * Ht - (0.064 * 1 * Wt) + 0.077 * 57;
%%
%TBW
clc
clear
modZ = 465.35;
phiZ = -10.31;
R = modZ*cos(deg2rad(phiZ));
Xc = modZ*sin(deg2rad(phiZ));

Ht = 175;
Wt = 65;
age = 24;

TBW = 9.54 + 0.492 *((Ht)^2)/modZ;
ECW = 2.53 + 0.18903*(((Ht)^2)/(modZ)) + 0.06753*Wt - 0.02*age;
FFM1 = -4.104 + 0.518 * (((Ht)^2)/R) + 0.231 * Wt + 0.130 * Xc + 4.229;

FM1 =  14.94 - 0.079 * (((Ht)^2)/R) + 0.818 * Wt - 0.231 * Ht - (0.064 * 1 * Wt) + 0.077 * 24;

