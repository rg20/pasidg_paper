gauge_etahistory_ConN1;
gauge_T1 = gauge_T/60;
gauge_eta1 = gauge_eta;
ids = find(gauge_T1 ~= 0);
gauge_T1 = gauge_T1(ids);
gauge_eta1 = gauge_eta1(:,ids);


gauge_etahistory_ConN2;
gauge_T2 = gauge_T/60;
gauge_eta2 = gauge_eta;
ids = find(gauge_T2 ~= 0);
gauge_T2 = gauge_T2(ids);
gauge_eta2 = gauge_eta2(:,ids);

gauge_etahistory_ConN3;
gauge_T3 = gauge_T/60;
gauge_eta3 = gauge_eta;
ids = find(gauge_T3 ~= 0);
gauge_T3 = gauge_T3(ids);
gauge_eta3 = gauge_eta3(:,ids);

gauge_etahistory_ConN4;
gauge_T4 = gauge_T/60;
gauge_eta4 = gauge_eta;
ids = find(gauge_T4 ~= 0);
gauge_T4 = gauge_T4(ids);
gauge_eta4 = gauge_eta4(:,ids);

chennai_model_N1 = gauge_eta1(3, :); chennai_model_N1 = chennai_model_N1(:)*100;
chennai_model_N2 = gauge_eta2(3, :); chennai_model_N2 = chennai_model_N2(:)*100;
chennai_model_N3 = gauge_eta3(3, :); chennai_model_N3 = chennai_model_N3(:)*100;
chennai_model_N4 = gauge_eta4(3, :); chennai_model_N4 = chennai_model_N4(:)*100;

tuticorin_model_N1 = gauge_eta1(4, :); tuticorin_model_N1 = tuticorin_model_N1(:)*100;
tuticorin_model_N2 = gauge_eta2(4, :); tuticorin_model_N2 = tuticorin_model_N2(:)*100;
tuticorin_model_N3 = gauge_eta3(4, :); tuticorin_model_N3 = tuticorin_model_N3(:)*100;
tuticorin_model_N4 = gauge_eta4(4, :); tuticorin_model_N4 = tuticorin_model_N4(:)*100;

okha_model_N1 = gauge_eta1(15, :); okha_model_N1 = okha_model_N1(:)*100;
okha_model_N2 = gauge_eta2(15, :); okha_model_N2 = okha_model_N2(:)*100;
okha_model_N3 = gauge_eta3(15, :); okha_model_N3 = okha_model_N3(:)*100;
okha_model_N4 = gauge_eta4(15, :); okha_model_N4 = okha_model_N4(:)*100;

mormugao_model_N1 = gauge_eta1(14, :); mormugao_model_N1 = ...
    mormugao_model_N1(:)*100;
mormugao_model_N2 = gauge_eta2(14, :); mormugao_model_N2 = ...
    mormugao_model_N2(:)*100;
mormugao_model_N3 = gauge_eta3(14, :); mormugao_model_N3 = ...
    mormugao_model_N3(:)*100;
mormugao_model_N4 = gauge_eta4(14, :); mormugao_model_N4 = mormugao_model_N4(:)*100;


chennai;  % record frequency is 5 mins
chennai_gauge = hh(:,4); n = length(chennai_gauge);
chennai_T = 0:5:5*(n-1); chennai_T = chennai_T(:) - 59;


tuticorin; % record frequency is 6 mins
tuticorin_gauge = hh(:,4); n = length(tuticorin_gauge);
tuticorin_T = 0:6:6*(n-1); tuticorin_T = tuticorin_T(:) - 59;


okha; % record frequency is 6 mins
okha_gauge = hh(:,4); n = length(okha_gauge);
okha_T = 0:6:6*(n-1); okha_T = okha_T(:) - 59;


mormugao; % record frequency is 5 mins
mormugao_gauge = hh(:,4); n = length(mormugao_gauge);
mormugao_T = 0:5:5*(n-1); mormugao_T = mormugao_T(:) - 59;

ms = 10;
lw = 2;
fs = 18;

figure(1)
plot(chennai_T, chennai_gauge, '-b', 'MarkerSize', ms, 'LineWidth', ...
     lw); hold on;
plot(gauge_T1, chennai_model_N1, '-r', 'MarkerSize', ms, 'LineWidth', ...
     lw);
plot(gauge_T2, chennai_model_N2, '-k', 'MarkerSize', ms, 'LineWidth', ...
     lw);
plot(gauge_T3, chennai_model_N3, '-m', 'MarkerSize', ms, 'LineWidth', ...
     lw);
plot(gauge_T4, chennai_model_N4, '-c', 'MarkerSize', ms, 'LineWidth', ...
     lw); hold off;
Lg = legend('gauge record', 'N=1', 'N=2', 'N=3', 'N=4');
set(Lg, 'Location', 'NorthWest', 'FontSize', 12);

xlabel('minutes after Earthquake', 'FontSize', fs);
ylabel('wave height in cm', 'FontSize', fs);
xlim([0 600]);
ylim([-400 400]);
set(gca, 'FontSize', fs);
set(gcf, 'color', 'white');

print -dpdf chennaiGaugeCon

figure(2)
plot(tuticorin_T, tuticorin_gauge, '-b', 'MarkerSize', ms, 'LineWidth', ...
     lw); hold on;
plot(gauge_T1, tuticorin_model_N1, '-r', 'MarkerSize', ms, 'LineWidth', ...
     lw);
plot(gauge_T2, tuticorin_model_N2, '-k', 'MarkerSize', ms, 'LineWidth', ...
     lw);
plot(gauge_T3, tuticorin_model_N3, '-m', 'MarkerSize', ms, 'LineWidth', ...
     lw);
plot(gauge_T4, tuticorin_model_N4, '-c', 'MarkerSize', ms, 'LineWidth', ...
     lw); hold off;

%Lg = legend('gauge record', 'pasidg');
Lg = legend('gauge record', 'N=1', 'N=2', 'N=3', 'N=4');
set(Lg, 'Location', 'NorthWest', 'FontSize', 12);

xlabel('minutes after Earthquake', 'FontSize', fs);
ylabel('wave height in cm', 'FontSize', fs);
xlim([0 600]);
set(gca, 'FontSize', fs);
set(gcf, 'color', 'white');

print -dpdf tuticorinGaugeCon


figure(3)
plot(okha_T, okha_gauge, '-b', 'MarkerSize', ms, 'LineWidth', lw); hold on;
plot(gauge_T1, okha_model_N1, '-r', 'MarkerSize', ms, 'LineWidth', lw);
plot(gauge_T2, okha_model_N2, '-k', 'MarkerSize', ms, 'LineWidth', lw);
plot(gauge_T3, okha_model_N3, '-m', 'MarkerSize', ms, 'LineWidth', lw);
plot(gauge_T4, okha_model_N4, '-c', 'MarkerSize', ms, 'LineWidth', lw); hold off;

%Lg = legend('gauge record', 'pasidg');
Lg = legend('gauge record', 'N=1', 'N=2', 'N=3', 'N=4');
set(Lg, 'Location', 'NorthWest', 'FontSize', 12);

xlabel('minutes after Earthquake', 'FontSize', fs);
ylabel('wave height in cm', 'FontSize', fs);
xlim([0 600]);
set(gca, 'FontSize', fs);
set(gcf, 'color', 'white');

print -dpdf okhaGaugeCon


figure(4)
plot(mormugao_T, mormugao_gauge, '-b', 'MarkerSize', ms, 'LineWidth', ...
     lw); hold on;
plot(gauge_T1, mormugao_model_N1, '-r', 'MarkerSize', ms, 'LineWidth', ...
     lw);
plot(gauge_T2, mormugao_model_N2, '-k', 'MarkerSize', ms, 'LineWidth', ...
     lw);
plot(gauge_T3, mormugao_model_N3, '-m', 'MarkerSize', ms, 'LineWidth', ...
     lw);
plot(gauge_T4, mormugao_model_N4, '-c', 'MarkerSize', ms, 'LineWidth', lw); hold off;

%Lg = legend('gauge record', 'pasidg');
Lg = legend('gauge record', 'N=1', 'N=2', 'N=3', 'N=4');
set(Lg, 'Location', 'NorthWest', 'FontSize', 12);

xlabel('minutes after Earthquake', 'FontSize', fs);
ylabel('wave height in cm', 'FontSize', fs);
xlim([0 600]);
set(gca, 'FontSize', fs);
set(gcf, 'color', 'white');

print -dpdf mormugaoGaugeCon