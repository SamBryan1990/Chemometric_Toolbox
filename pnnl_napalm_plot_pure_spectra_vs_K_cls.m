function pnnl_napalm_plot_pure_spectra_vs_K_cls

    % Copyright 2022 Battelle Memorial Institute
    data = load('pnnl_napalm_data');
    ConstituentNames = data.ConstituentNames;
    Wavenumbers = data.Wavenumbers;
    WavenumberLabel = data.WavenumberLabel;

    % Pure spectra
    pure_spectra = pnnl_napalm_pure_spectra;

    % K_cls
    [~, ~, K_cls] = pnnl_cls(data.A_train,data.C_train,data.A_unknown);

    figure
    % Get first three default colors and clear the figure
    plot(1,1,2,2,3,3);
    colorOrder = get(gca,'ColorOrder');
    clf
    lineWidth = 1;
    pureLineSpec = '.';
    KLineSpec = '-';
    h = subplot(3,1,1);
    plot(Wavenumbers,pure_spectra(1,:),pureLineSpec,...
        Wavenumbers,K_cls(1,:)*100,KLineSpec,...
        'LineWidth',lineWidth,'Color',colorOrder(1,:))
    legend(ConstituentNames{1},'K_{cls}(1,:) \cdot 100')
    title('Absorbance Spectra of Pure Constituents')
    h(2) = subplot(3,1,2);
    plot(Wavenumbers,pure_spectra(2,:),pureLineSpec,...,
        Wavenumbers,K_cls(2,:)*100,KLineSpec,...
        'LineWidth',lineWidth,'Color',colorOrder(2,:))
    legend(ConstituentNames{2},'K_{cls}(2,:) \cdot 100')

    h(3) = subplot(3,1,3);
    plot(Wavenumbers,pure_spectra(3,:),pureLineSpec,...
        Wavenumbers,K_cls(3,:)*100,KLineSpec,...
        'LineWidth',lineWidth,'Color',colorOrder(3,:))
    legend(ConstituentNames{3},'K_{cls}(3,:) \cdot 100')
    xlabel(WavenumberLabel,'Interpreter','tex')
    set(h,'FontSize',14);
    set(h,'YLim',[-0.1 2.5]);
    linkaxes(h);
end

function pnnl_napalm_plot_pure_spectra_vs_K_clsx
    data = load('pnnl_napalm_data');
    ConstituentNames = data.ConstituentNames;
    Wavenumbers = data.Wavenumbers;
    WavenumberLabel = data.WavenumberLabel;

    [~, ~, K_cls] = pnnl_cls(data.A_train,data.C_train,data.A_unknown);

    % Pure spectra
    [benzene_spectrum, polystyrene_spectrum, gasolene_spectrum] = pnnl_napalm_pure_spectra;


    % Single constituent spectra against rows in K_train_calculated
    predicted_label = 'K_{cls}';
    figure;
    clf
    line_width = 2;

    h = plot_this_spectrum(1,benzene_spectrum);
    h(2) = plot_this_spectrum(2,polystyrene_spectrum);
    h(3) = plot_this_spectrum(3,gasolene_spectrum);

    xlabel(WavenumberLabel,'Interpreter','tex')
    set(h,'FontSize',14);
    linkaxes(h,'x');

    function h = plot_this_spectrum(index,this_spectrum)
        h = subplot(3,1,index);
        plot(Wavenumbers,this_spectrum,...
            Wavenumbers,K_cls(index,:)*100,...
            'LineWidth',line_width);
        legend('Pure spectra',predicted_label,'Interperter','tex')
        title(ConstituentNames{index})
    end

end
% Disclaimer
%
% This material was prepared as an account of work sponsored by an agency of the
% United States Government.  Neither the United States Government nor the United
% States Department of Energy, nor Battelle, nor any of their employees, nor any
% jurisdiction or organization that has cooperated in the development of these
% materials, makes any warranty, express or implied, or assumes any legal
% liability or responsibility for the accuracy, completeness, or usefulness or
% any information, apparatus, product, software, or process disclosed, or
% represents that its use would not infringe privately owned rights.
% 
% Reference herein to any specific commercial product, process, or service by
% trade name, trademark, manufacturer, or otherwise does not necessarily
% constitute or imply its endorsement, recommendation, or favoring by the United
% States Government or any agency thereof, or Battelle Memorial Institute. The
% views and opinions of authors expressed herein do not necessarily state or
% reflect those of the United States Government or any agency thereof.
% 
%                  PACIFIC NORTHWEST NATIONAL LABORATORY
%                               operated by
%                                 BATTELLE
%                                 for the
%                    UNITED STATES DEPARTMENT OF ENERGY
%                     under Contract DE-AC05-76RL01830