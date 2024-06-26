This is the implementation of [1,2], that is a partially hidden autoregressive Markov model (ARPHMM) for RUL prediction. Partially hidden, partially supervised, weakly hidden, weakly supervised, weak prior, soft labels, noisy labels, uncertain and imprecise labels, etc focus on taking account of a prior on the latent space, here for an ARHMM. 

The code provided allows to get an idea of how the algorithm works.


## Getting Started

1. Download https://github.com/emmanuelramasso/CHMM_with_partial_labels, add folders and subfolders to path.
2. Run example in `main_rul.m`

## References

The idea of including partial knowledge on states is from [1] and [2] applied to prognostics. In [3] we used a similar algorithm for modelling acoustic emission signals. 


[1] On partially supervised learning and inference in dynamic Bayesian networks for prognostics with uncertain factual evidence: Illustration with Markov switching models, Pablo Juesas, Emmanuel Ramasso, Sébastien Drujont, Vincent Placet,  Proceedings of the European Conference of the PHM Society, Vol. 3 No. 1 (2016), https://doi.org/10.36001/phme.2016.v3i1.1642

[2] Autoregressive Hidden Markov Models with partial knowledge on latent, space applied to aero-engines prognostics, Pablo Juesas, Emmanuel Ramasso, Sébastien Drujont, Vincent Placet,  arxiv https://arxiv.org/abs/2105.00211, 2024.
 
[3] Ramasso, E., Butaud, P., Jeannin, T., Sarasini, F., Placet, V., Godin, N., ...Gabrion, X. (2020). Learning the representation of raw acoustic emission signals by direct generative modelling and its use in chronology-based clusters identification. Eng. Appl. Artif. Intell., 90, 103478. doi: 10.1016/j.engappai.2020.103478


