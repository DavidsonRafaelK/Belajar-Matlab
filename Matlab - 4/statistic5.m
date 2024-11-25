clear
clc

% Observed and Expected Frequencies
observed = [28, 36, 36, 30, 27, 23]; % Observed frequencies
n = sum(observed); % Total observations
expected = n / 6 * ones(1, 6); % Expected frequencies for a balanced die

% Degrees of Freedom
df = length(observed) - 1;

% Significance Level
alpha = 0.01;

% Calculate Chi-Square Test Statistic
chi_square_stat = sum((observed - expected).^2 ./ expected);

% Critical Value from Chi-Square Distribution Table
chi_square_critical = chi2inv(1 - alpha, df);

% Hypothesis Testing
if chi_square_stat > chi_square_critical
    hypothesis_result = 'Reject H0: The die is not balanced';
else
    hypothesis_result = 'Fail to Reject H0: The die is balanced';
end

% Display Results
disp(['Chi-Square Statistic: ', num2str(chi_square_stat)]);
disp(['Critical Value: ', num2str(chi_square_critical)]);
disp(['Hypothesis Test Result: ', hypothesis_result]);

% Plot Chi-Square Distribution
x = linspace(0, 30, 500); % Range for Chi-Square distribution
chi_square_dist = chi2pdf(x, df); % Chi-Square PDF

% Plot settings
figure;
plot(x, chi_square_dist, 'b-', 'LineWidth', 1.5); hold on;
xline(chi_square_critical, 'r--', 'LineWidth', 1.5, 'Label', 'Critical Value');
xline(chi_square_stat, 'g-', 'LineWidth', 1.5, 'Label', ['\chi^2 = ', num2str(chi_square_stat)]);
fill([chi_square_critical x(x > chi_square_critical) max(x)], ...
     [0 chi_square_dist(x > chi_square_critical) 0], 'r', 'FaceAlpha', 0.3, 'EdgeColor', 'none');
title('Chi-Square Distribution');
xlabel('\chi^2');
ylabel('Density');
legend('\chi^2 Distribution', 'Critical Value', 'Observed \chi^2', ...
       'Critical Region', 'Location', 'NorthEast');
grid on;
hold off;
