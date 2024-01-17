clear all; close all; clc;

%% Setup
% Observation periods
tstart = datetime(2021,01,05,0,0,0);
tend = datetime(2021,01,06,0,0,0);
nsec = 30;
times = tstart:seconds(nsec):tend;
sc = satelliteScenario(tstart,tend,nsec);

% Load in satellite TLE
sat = satellite(sc,"iss_tle.tle","Name","ISS");
gpsconst = satellite(sc,"gpsAlmanac.txt"); % not sure how accurate this is

% Get ground station vector
LAT = 53.350818;
LON =  -112.97384;
gs = groundStation(sc,LAT,LON);

%%
[azz,elz,rangez] = aer(gs,sat); % calculate az, el, and range for all times

%% 
disp(times(elz>0))