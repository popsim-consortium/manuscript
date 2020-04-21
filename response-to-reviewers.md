Dear Graham,

[Introductory text]


Please see below a point-by-point response to the comments.



# Editors comments

> 1) Ensuring that the language about the models & parameters conveys the correct sense of uncertainty. Obviously the reviewers and the authors know that these just represent best guesses at the moment, but as this platform catches on we don't want these numbers & models to be seen as gospel.


We fully agree that the language in the original manuscript was not careful enough in conveying uncertainty about the models and parameters we discuss.
To address this, we have made edited the text throughout the manuscript trying to better convey this uncertainty.
See our response to Reviewer 1 below for examples.
We have also added a bit more to the discussion (below "next steps") on this point.


> 2) We would like to see the SLIM integration demonstrated with an application that msprime doesn't cover. This could be, for example, a figure of the average value some summary statistics surrounding a selective under the human demographic model. The reviewers didn't want this to be a lot of work, e.g., it would be outside of the scope of the current paper to demonstrate the power of a range of selection methods. However, we felt that a simple demonstration of the functionality would substantially increase the scenarios easily available and imaginable by readers of the paper.

Issue #150 (jadrion) will add the figures we need and some explanation;
we need to explain here (and maybe in the text) that selection is beyond the scope of this paper,
and instead we are focusing in the paper on validating scaling.
This will also be covered by issue #164.

> 3) We felt that the discussion would benefit from a discussion of the details not yet incorporated into the platform, e.g. sex-specific recombination, gene conversion, assembly error, structural variants etc. Such an addition might spur future development, and also give the authors an opportunity to discuss general ways forward on these issues.

Good idea -
we have expanded the section of the discussion ("next steps")
with more detail on our future plans.
We're trying to walk the line between being forward-looking and promising too much.

> 4) We would be interested to see more of a discussion of the strengths and weakness of the various demographic inference methods.

We have added an additional paragraph to the discussion exploring some of the additional factors that may affect choice of inference method, beyond results like those presented here. These include data required, type of model, and software engineering. A comprehensive investigation of these issues is beyond the scope of the current manuscript, which focuses on the resource itself, rather than its application.

> Beyond testing methods, another major use axis that I can personally see for this platform is for empirical researchers to see whether patterns they see in their data are consistent with known demographic models. For example, demonstrating whether the frequency spectrum in larger samples lines up with previously inferred models. Having all of these models implemented in a central place will significantly lower the barrier of entry of empirical researchers into rigorous simulation frameworks.

This is an important point - we have (naturally) focused on methods benchmarking,
but our impact could well be greater if stdpopsim becomes widely used among empirical researchers
(for whom on average running realistic simulations presents a greater barrier than to developers of computational methods).
We've added a paragraph about this to the Discussion
and additional words to the Abstract.

> Overall we are very excited to see this big move forward and welcome the authors' careful work in this important area.

Thanks for the kind words!
We are enthusiastic about it as well.

-----

# Reviewer 1


> The manuscript describes a community effort to standardize population genetic simulations and it presents an example of the resource's utility for method's testing. This development answers a long-standing need in the population genetics community for greater standardization and ease-of-implementation of simulation protocols. As such, I expect it will be a well-used resource and it represents an important advance for the field's practices. From the test implementation included in the paper, it was remarkable to see how highly variable (and often poor) the performance of the demographic inference methods was, and those results add to the scientific contribution of this manuscript.
>
> Some of the specific features that are nice about the work are the incorporation of inferred genetic maps where possible, the automated output of citation information, the use of long-term stable identifiers for models and genetic maps, and the outputting of provenance information in the tree sequence files.

Thank you!


## Major comments

> 1. Emphasize parameters are current best-guesses:
> a. I am most worried about the fragility of the models over time and the misperception one might have that these models are "accurate" for a species. Genome assemblies change, recombination rates improve, mutation rates change, etc. I would like to see that uncertainty reflected more in the language used in the paper so that it's clear the catalog is a collection of inferred parameters that are subject to change over time. This is a subtle and cosmetic, but important I think. For example, page 4 "the library defines basic information about each species genome, including information about chromosome lengths, average mutation rates, and generation times." Yet, this is information we don't have - each of these parameters is actively under revision/discussion for even the best studied species. It would be great to hammer home these are all inferred values. (Also see page 3 sentence on "details on =the= physical organization of the genome"; the same comment applies, and an improvement might be something like "details on the physical organization of the latest reference genome assembled for the species").

We thank the reviewer for bringing up this important point
and fully agree that the language in the manuscript needs to better emphasize the uncertainty in our current parameter estimates.
To address this, we have made several changes throughout the manuscript, including the passages cited above:

The first quoted passage now reads:
"For each organism, the catalog contains information on our current understanding of
the physical organization (e.g., chromosome structure) of its genome,
one or more inferred genetic maps (except for \textit{E.~coli}),
default population-level parameters (mutation rate and generation time estimates).
The catalog also contains numerous published demographic models for the first three species.
These available models and parameters are meant to represent the field's current understanding,
and we intend for this resource to evolve as new results become available."

The second passage now reads:
" Firstly, the library defines some basic information about our current understanding of each 
species' genome, including information about chromosome
lengths, average mutation rate estimates, and generation times.
We also provide access to detailed empirical information such as inferred genetic maps,
which model observed heterogeneity in recombination rate along chromosomes."

(The reviewer's suggestion is good, but we think that "current understanding"
conveys roughly the same meaning as "the latest reference genome" in less words,
and without making promises about genome assemblies.)


> b. On a related note, there is wording on page 4, regarding ensuring "implemented models are accurate" - I think what is meant is that the "implemented models are faithful to the source publications from which they derive". As the second half of this paper makes clear, because of errors in inference, many of these models will not be accurate, in the sense of representing the true history of the species.

We made the suggested change:
"Importantly, we have rigorous quality control methods to ensure that we have
correctly implemented the models as described in their original publication
and have documented methods for others to contribute new modules."

> 2. It would be wonderful to have a comments section for the models that would be either curated by a set of editors or crowd-sourced. I say this because over time, models will proliferate, and some will come to be regarded as out-of-date. One can imagine those approaching the field afresh will be overwhelmed by the possible selections and possible implement models that become outdated. If the goal is standardization, how do we communicate that standards change? A comment system (or even star-rating system?) may be wise to implement now. Assuming it can be layered on top of the existing structure, it may be enough for this publication to note this as a future challenge that needs development/addressing.

Thank you for this forward-thinking comment.
We considered various ways to do this
(e.g., by enabling the wiki associated with the github repository:
\url{https://github.com/popsim-consortium/stdpopsim/issues/415}),
but ended up deciding that (a) it's not yet clear what the right way to do this is,
and (b) it'll be significant work to do right that we aren't prepared to do at the moment.
Since we haven't encountered the problem of out of date models yet,
we feel happy about postponing this until the problem arises.

> 3. In terms of the maturity of the examples developed for the initial release, I would have liked to see at least one simulation model with a selective sweep, one with background selection, and one with spatial stepping-stone structure. Each of these would be helpful test cases to implement to be sure that the existing catalog framework has the breadth/flexibility necessary to accommodate future use cases. I do not think this is a requirement for publication, but it would add great value to this initial release of the resource.

We would like to see this also!
But, we felt that the amount of work it took to get to this point
made this a good point to release the publication.
Furthermore, discussing selection would distract from the current relatively simple focus
on inference of demographic history.
We definitely intend to include selection (and expand the available generic models) in future work,
however, as we now discuss in greater detail in the Discussion ("next steps").

> 4. Page 15. The approach of masking "low-recombination" portions of the chromosomes seems like an incomplete/indirect attempt to model the inherent limitations of sequencing to an "accessible" genome.
> a. Shouldn't the approach instead be to drop "low complexity" regions (e.g., as defined by an excessive number of "N"'s in the reference, low mapability scores, or via tools like RepeatMasker?). This part of the pipeline seems open to refinement.

Maybe so, but beyond the scope?
Issue #166 (andrewkern)

> b. Are the "masks" a separate configuration file for the simulations? It seems that it would be preferable for them to be separate from the recombination rate files - right now it reads as if the mask applied is a function of the genetic map file, but this seems too inflexible for users who prefer an alternative approach to masking.

Each software package requires its own kind of masking - eg smc++ requires a bedfile.
Issue #166

## Minor comments


> 1. Is the provenance information only provided if msprime is used to produce tree sequence files? Is a similar functionality in place with the SLiM back-end?

SLiM also records sufficient information to reconstruct the simulation in the tree sequence provenance
(including the software version, random seed, and a copy of the simulation script).


> 2. Little detail is given on the system of identifiers/versioning for models, maps, etc.

True, but the details are rather pedantic, and we provide a link
to our documentation where we describe the system in detail.

> 3. In the abstract, it's left vague what the nature of the resource is.
>
> a. The resource is described as an open source project and a catalog, but the fact that it's a web repository that contains a set of configuration files might be helpful to say explicitly.
> b. Also, while I wouldn't normally include url to software in an abstract, in this special case it seems like it could be very helpful to readers who want to jump right to the resource quickly?

Good point - we've clarified the nature of the resource,
but haven't included the URL since googling "stdpopsim" features the correct page as the top hit.

> 4. Page 3: "bespoke simulations":
>
> a. "bespoke" struck me as a distracting word choice, given its contemporary associations. Upon checking a dictionary, I see how it is an appropriate and precise word choice, but maybe it's best to instead simply say: "custom" or "one-off".
> b. To elaborate on the point you're making here, you could also share how the general modus operandi often includes the pasting of long unwieldy command-line calls for generating simulations into methods sections. Many of these command-line values are buried across the literature, often in supplementary methods. Additional virtues of your catalog is having: 1) a central repository for such models, and 2) modular configuration files (e.g. I can keep the same demographic model, but change the recombination map, without having to re-write, or learn, the innards of a complex command-line for ms/msprime)

We've replaced "bespoke" with "coded from scratch", which we think is more descriptive,
and added a parenthetical note about command-line calls in supplementary material (which is a good point).
We hope that the other points are made elsewhere.


> 5. Page 5, "accurate, standardized simulations": related to the point above about "accurate" models - I wonder if a different word should be used here, or even omit "accurate". The word doesn't add much value over simply saying the models are standardized - the standardization includes that the model implementation is quality controlled to match the original source publication, which I think is what is meant by accuracy here?

We agree that "accurate" could be a misleading term here so have removed it from the manuscript.

> 6. Page 6. Typo in "time or writing". Change to "time of writing"

Thanks for spotting this typo! We corrected it.


> 7. Page 8. I like the approach of showing inverse coalescent rates, but it would be instructive to practitioners and useful for teaching, if in all figures you showed both the census sizes (e.g. with light grey dashed lines) and inverse rates (e.g. with dark grey solid lines as now in Fig 2).

We agree that adding both census size and inverse coalescence rates to these plots would instructive. Thus, we have added census size to all of the single population analysis plots (Figs 2, 3, S1, S2, and S3) in addition to ICR. However, after some discussion, we have decided that adding ICR to the two population analysis plots (Figs 4, S5, and S7, which currently only have census size) might not be appropriate since these multi-population analyses do to some extent account for the effects of migration that are ignored in the single-population case, and should therefore be able to recover the true simulated population sizes.

Finally, we note that we have decided to instead describe the true simulated population sizes as the "simulated population size" rather than "census size" as we realized the use of "census" here could be misleading (see below for further discussion).

FIXME: add the census sizes to Figs 2, 3, S1, S2, and S3 and edit figure captions
Issue #160 (jradrion)


> 8. Figure 4.
> a. Confusing how in panels A and B time moves left to right, and in panel C time moves right to left.
> b. Also, the figure would be improved by showing with vertical lines the timing of the CEU/YRI divergence in the true model. (similar comments hold for Figures S4 and S5)

We agree that the orientation of this figure is confusing, and so have changed it as suggested. In addition, we had previously plotted divergence times here as vertical lines, however we felt that plotting it this way made the figure hard to read since there was a great deal of overlap between these lines and the N(t) lines on the figure, which was was especially difficult to read when including multiple replicates. Thus, we prefer to keep the lower divergence times panel for improved readability.


> 9. Page 16 "checked for convergence" : Wording - sounds like checking for convergence between the methods - I think you mean convergence by each method to an optimum in their respective objective functions.

Good point - we changed the wording here as follows:

"For each simulation
replicate, we performed 10 runs of dadi and fastsimcoal, checking to ensure that
each method reached convergence."


> 10. Page 31. This is all very nice. To save readers a step, could you include the command-line flag for how to have msprime output the coalescence rate function?


Thanks!
There is not a command-line flag for obtaining the coalescence rates,
but this is easily obtainable in python.
We've added a paragraph to the supplement explaining what methods to use.


# Reviewer #2

> The authors in this manuscript describe the implementation of a publicly curated, open source simulation package called stdpopsim - equipped with commonly utilized population genetic demographic models in humans, Drosophila melanogaster, and Arabidopsis thaliana. I am in awe of what these authors have achieved, in terms of benchmarking these standard models in an effort to avoid duplication of effort, and possibility of erroneous inference. The package is currently equipped with several "in-built" models that allow the simulation of trees with msprime and SLiM. The authors explain the application of these models by simulating and benchmarking estimates of Ne under a couple of scenarios. The manuscript is also well written, and use popular tools like dadi and smc++ to estimate and benchmark the simulations under a variety of models. Across all simulated scenarios (except under more complex models), the simulations seem relatively accurate.

Thanks for the encouragement!

> Despite a little hiccup with python version mismatch prior to me successfully installing stdpopsim, I was able to successfully get the tutorials running within minutes after. I have one recommendation however for the tutorials - it would definitely help if the CLI versus python tutorials were kept separate. I found it a little confusing since they are all listed on the same page (https://stdpopsim.readthedocs.io/en/latest/tutorial.html). The simulations, testing models, calculating divergences, plotting ran without a hitch, and I am impressed and excited to play around with more models in coming days. Having also developed similar libraries/pipelines, I have also found it extremely useful for developers to provide some more detailed documentation/tutorials via Jupyter notebooks, or some similar platform. I did however notice that the authors have provided their analyses as Snakemake files in the interest of replication. I did not replicate their analyses, but I trust that the documentation for these analyses are detailed enough to aid readers/users in establishing similar analysis pipelines for stdpopsim simulated data.

Good idea -
we have reorganized the Tutorials and added to them,
and have also have added in a basic `stdpopsim` API and CLI example in a Jupyter Notebook that can be accessed and used interactively via Binder and encourage users to try out the tutorials there.
We have linked to the Binder in the README on the GitHub. See https://mybinder.org/v2/gh/popsim-consortium/stdpopsim/master?filepath=stdpopsim_example.ipynb


> I thoroughly enjoyed reading this manuscript, and learning of all the new features that have been written into stdpopsim, and believe that this will be an invaluable contribution to the population genomics community.

Thank YOU! We hope you are right.

## Minor comments:

> The authors mention the implementation of the SLiM package into stdpopsim, but I was unable to find any details of this either in the manuscript or on the readthedocs page. If this was indeed implemented, I would also like to see the authors add some tutorials/results of analyses based on SLiM simulated data.

FIXME add description of what we added to the manuscript here.

> "Adding further maps to the library is trivial" - discuss - since the audience for this is the broader pop-gen community, perhaps pointing them to the detailed development environment on readthedocs would be helpful.

We've changed "trivial" to "straightforward", which is more accurate.
Unfortunately, we don't have documentation written for this --
currently, the suggestion would be to look at how existing maps work and copy that (which should in fact be straightforward) --
but it's on our list of things to do to document this.


> Fig S6: The figure captions/labels are acronyms, which aren't explained. Would help readers to understand what this plot is estimating.

We added a sentence to the caption better explaining this figure.


# Reviewer #3


## Summary


> The authors present a standardized framework for creating reproducible population genetic simulations. This resource will allow researchers to create models for new species/scenarios, and easily compare methods on the same dataset. The authors are correct that the current state of benchmarking in population genetics causes inconsistency, duplicated effort, and confusion about the performance of different methods. The authors highlight that creating a realistic and meaningful simulation study is a barrier to entering this field, and I absolutely agree. I will be passing this resource on to my students and look forward to using it myself. Stdpopsim is a crucial step forward. The manuscript itself is well-written and describes an extensive comparison of demography methods in a variety of species/scenarios. I have a few comments and some typos, etc.

Thanks! We hope it is useful to you and your students.


## Comments

> 1) The authors mention that SLiM can be used as an alternative backend, which would presumably allow for simulations with selection. Although I don't think an extensive comparison of selection methods is necessary for this paper, it would be ideal if the authors can give some idea of how this would work (example command line, etc). There are also a myriad of methods for detecting/quantifying selection, and these simulations are not consistent either.

FIXME: fill this in.
Issue #150 and #164, as above.


> 2) I like the inclusion of the "zigzag" history, as well as generic piecewise constant models and IM models (page 7). I wonder if these could be included in a separate section (not organism specific) in the documentation and software (and then in Table 1). Right now the zigzag model is under humans in the catalog.

FIXME: maybe we should do this?

Note that zigzag is in human because the parameterization is human-ish.

>
> 3) On page 8 the authors set up notation for the number of replicates (R), number of chromosomes (C), and sample size (n), but don't seem to use it afterward (or use it inconsistently). It would be helpful if all the figure captions and main text included this notation (I am guessing the number of replicates is 3 based on the images, but this should be clarified). The authors use N in the Methods (i.e. page 15) to refer to population size (which makes sense), but then also say "In all cases we set the sample size of the focal population to N = 50 chromosomes." For MSMC, the sample size was set to n=2,8 which suggests haploid samples, but the "Calculating coalescence rates" section says that n is the diploid sample size.


We see why this is confusing.
We introduced this notation (R, C, and n) to make it completely clear
in this paragraph what exactly was being simulated,
but we feel that continuing to use this notation elsewhere would actually obscure things,
since we don't do any calculations with these quantities.
We have changed the "n" in the Supplement to an "m".


> 4) "Calculating coalescence rates" section needs a read through. Reword first sentence and add some citations (especially regarding computing p(t) and p(z,t)).
> It was unclear to me how the "mean coalescence times" were used (the rate was used to compute the ground truth over time). This section is also referred to as the Appendix in the main text.

We've expanded the first sentence substantially, and added a few more citations.
We apologize that we don't know of a paper to cite that does precisely the same calculations
(but don't doubt that such a paper exists),
and instead refer only vaguely to "general theory of Markov chains" (but now with a citation).
The section is now explicitly labeled "Appendix".
Hopefully this is more clear now.

> ## Minor Comments

> For a future draft, line numbers would be very helpful.

Done, and sorry we omitted this the first time around.


> -Abstract: "possibility for error" -> inconsistency

We made the suggested change.

> -Page 5: trivial -> straightforward

Good point: this was probably inaccurate. We made the suggested change.


> -"tree sequence": make it clear that users can easily obtain traditional variant matrices from this format, in case they are unfamiliar

We added the following statement:
"The tree sequence format could also be converted
to other formats (e.g., VCF) by the user if desired."

> -Page 6: "time or writing" -> of

Whoops: we corrected this typo.


> -Page 8: "While there is variation in accuracy among methods, populations, and individual replicates, the methods are generally accurate for this model of human history." I'm not sure I agree here (although perhaps relative to other models this statement is true). Discuss a bit more.

"Accurately" is subjective -- we're sure the reviewer can imagine much worse inferences! --
but in any case we've rephrased this bit to say
"While there is variation in accuracy among methods, populations, and individual replicates,
the methods generally infer back a good estimate
of the true effective population sizes of the simulations --
inferred values are mostly within a factor of two of the truth,
and many of the methods infer a bottleneck at the correct time."


> -Page 8, paragraph "Stdpopsim allows...": reword this first sentence

We changed the sentence as follows:
"Using stdpopsim, we can readily compare performance on this benchmark to
that based on a different model of human history. "


> -Figure 3 caption: wrong citation, should be Sheehan and Song

The citation was for the genetic map, but we've added the citation to Sheehan and Song for the model (also in the caption of Figure 2).


> -Page 10, last sentence before "Multi-population demographic models" section: clarify what "this setting" is (both species I assume)

We made the following change:  
"Accuracy is mixed among methods when doing inference on simulated data from these D. melanogaster
and A. thaliana models, and generally worse than what we
observe for simulations of the human genome."


> -Figure 4 captain: "or smc++" -> "and smc++" (some other figure captions have this too), I would also say "$x$-axis"

We made the suggested changes.

> -Page 12, first paragraph: include a reference where people could learn more about the effective population size vs. census size, random-mating models, etc

We thank the reviewer for this suggestion.
However, we have realized that our use of "census size" here to describe the "true" simulated population size was a bit misleading,
as our intention was not to characterize these as actual "census" (as opposed to "effective") population sizes.
To avoid this confusion, we have changed the manuscript to now describe them as the "simulated population size". For example, this section now reads:

"However, because model misspecification
here is less severe  compared to the single-population case, we compare
our inferred population sizes only to the simulated population sizes (black line in
Figure 4C) and not the inverse coalescence rates."

We have, however, added more discussion of this point (with a citation to a review)
to the start of the Appendix.


> -Page 12 (and elsewhere): "By contrast" -> "In contrast"(?) I think both are technically correct though

We changed all instances of "by contrast" to "in contrast".

> -Page 12: sentence beginning with "Figure S4 shows..." is long, perhaps breakup or rephrase ("bottleneck into a European population" sounds odd to me.)

We changed this section to the following:  
"Figure S4 shows inference results using data simulated under
the OutOfAfrica_2L06 model. This model includes an ancestral population in
Africa from which a European population splits off following a bottleneck, with no
post-divergence gene flow between the African and European population (Figure S4A)."

> -Page 12: "Europe population" -> "European population"

We made the suggested change.

> -Page 12: S7, S4, S6 are mentioned in a different order than they appear in the supplement (I understand why but maybe revisit this part)

We reordered the figures to make sure they were referenced in the same order they appear in the supplement.

> -Page 13: "overfit the YRI history" do you mean overfit in a technical sense?

Really, we just mean that the inferred history has more population size changes
than the truth did;
we've change this to "overcomplicate the simple YRI history".


> -Page 14: "Method quality control" section. Could you say a bit more about how Developer B would be identified? Someone in the consortium or someone else in the community? What kind of leadership structures are in place? (Maybe the goal is to make this a bit more distributed?) And just to be clear, Developer B would not have access to Developer A's implementation of the model while they were independently implementing it, right?

We've clarified this to say that "Developer B (perhaps found by requesting review from the broader Consortium)".
The process is not blinded in any way -- developer B *could* look at developer A's implementation --
but we don't think this will be a problem in practice.

> -Page 16, line 6: "population 1 after"?

The "1" here was a typo - we removed it.

>
> -Page 16: S5 -> Figure S5

We corrected this mistake.

>
> -Page 17: "with making" -> "for making"?

Thanks! We corrected this.


> -Figure S2 caption: move "and" to before MSMC (in a few other figure captions too)

We made the suggested change.


> -Figure S6: explain x-axis "MIG_AF_EU" and "MIG_EU_AF". I assume these are directional migration rates

We added a sentence to the caption better explaining this figure.


> -Figure S9: unreadable when printed (not sure it adds a lot)


We removed this figure.
