%____________________________________________________________
%                   Author: Christie Condron 
%                      Controller Design 
%_____________________________________________________________

prompt_poles = 'Where are the poles located for the plant? ';

poles = input(prompt_poles);
G = zpk([],poles,1)

%{
   for i = 1:numel(poles)
    if poles[i] > 0 
    elseif poles[i] = 0
    else
    end
end
%}

prompt_OS = 'What is the desired percent overshoot? ';
OS = input(prompt_OS)
prompt_Ts = 'What is the desired settling time (in seconds)? ';
Ts = input(prompt_Ts)

% calculating system parameters
zeta = -log(OS/100)/sqrt(pi^2+log(OS/100)^2);
wn = 4/(zeta*Ts);

rlocus(G)
sgrid(zeta,0)
[K,p] = rlocfind(G)
G_cl = feedback(K*G,1)
step(G_cl)
step_info = stepinfo(G_cl)

%step info will show overshoot and settling time obtained




