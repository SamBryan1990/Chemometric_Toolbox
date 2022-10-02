function pure_spectra = pnnl_napalm_pure_spectra

    % Copyright 2022 Battelle Memorial Institute
    data = load('pnnl_napalm_data');
    A_train = data.A_train;

    % In the training set,
    %   C_train([1,9,12],:) =
    %   benzene polystyrene gasoline
    %      0       0          100  (1)
    %    100       0            0  (9)
    %     65      35            0  (12)
    benzene_spectrum = A_train(9,:);
    polystyrene_spectrum = (A_train(12,:) - A_train(9,:)*0.65)*(100/35);
    gasolene_spectrum = A_train(1,:);
    pure_spectra = [benzene_spectrum
        polystyrene_spectrum
        gasolene_spectrum];
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