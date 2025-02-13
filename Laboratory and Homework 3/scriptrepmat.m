clc
clear all
close all

N = 5;
x = [1 1 -1 -1];
xr = repmat(x,1,N);
n = 0:length(xr) - 1;
stem(n,xr);