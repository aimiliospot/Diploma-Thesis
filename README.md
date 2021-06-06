# Diploma Thesis - Aimilios Potoupnis

In my diploma thesis, I aim to make an introduction to Cole - Cole dielectric media
and develop an FDTD (Finite Difference Time Domain) scheme for the simulation of
Electromagnetic wave propagation on the aforementioned materials. The Cole - Cole
equation is a very helpful model for a variety of dispersive materials, such as polar
molecules, polymers and biological tissues.<br /><br />
Due to the existence of jω term in the Cole - Cole equation (frequency domain), the
time - domain constitutes equation is expected to involve derivatives of fractional order. To
circumvent this difficulty, the FILT (Fast Inverse Laplace Transform) method is proposed, for
the numerical inversion of Laplace Transform. However, Maxwell’s equations in time -
domain demand convolution calculations, which require vast memory usage. To overcome
this problem, Prony’s method is proposed, which approaches a positive decreasing
sequence as a summation of positive exponentially damped sequences. Prony’s method
combined with Z - Transform, reduce memory requirements to minimum and optimize the
algorithm.<br /><br />
Finally in order to examine the accuracy of the method, a simulation of an
Electromagnetic wave propagating from Free - Space to Cole - Cole dispersive media is
described, followed by the calculation of the Reflection Coefficient for a satisfactory
frequency range with the use of Discrete Fourier Transform. Thus, the simulated and
theoretical Coefficient’s
diagrams are compared, revealing low relative error between simulated and theoretical
values.
