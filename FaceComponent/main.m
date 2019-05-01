% Reads all candidates data
candidate_data = read_candidate_data();

% Configurations
w = 112;
h = 92;

% Load images
Imgs = candidate_data{1};
L = Imgs(:, 1);
L = reshape(L, w, h);
image(L);
colormap(gray(256));
daspect([1 1 1]);

[Vecs, Vals, Psi] = compute_eigenvectors(Imgs, 30);
plot(Vals);

CVals = zeros(1, length(Vals));
CVals(1) = Vals(1);
for i = 2:length(Vals)
   CVals(i) = CVals(i - 1) + Vals(i); 
end
CVals = CVals / sum(Vals);
plot(CVals);
ylim([0 1]);

pc_ev_1 = Vecs(:, 1);
pc_ev_1 = reshape(pc_ev_1, w, h);
imagesc(pc_ev_1);
daspect([1 1 1]);

OrigImg = Imgs(:, 1);
Projection = Vecs(:, 1:end)' * (OrigImg - Psi);
Reconstruction = Vecs(:, 1:end) * Projection + Psi;
Reconstruction = reshape(Reconstruction, w, h);
imagesc(Reconstruction)
colormap(gray(256));
daspect([1 1 1]);