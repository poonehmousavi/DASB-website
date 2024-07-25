---
title: TGB Dataset Overview
permalink: /docs/dataset_overview/
---

<!-- Benchmark datasets are broadly classified into three categories representing three key graph machine learning tasks.  -->
<style>
r { color: rgb(231, 41, 138) }
b { color: Blue }
g { color: rgb(27, 158, 119) }
</style>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <p class="lead">
                The Temporal Graph Benchmark~(TGB) aims to provide datasets and evaluation protocols for realistic, reproducible, and robust evaluation for machine learning on temporal graphs. 
            </p>
            <p class="lead">
                <b>Edge and Node-level tasks:</b> We include both the dynamic <a href="../linkprop/">link property prediction</a> task and the dynamic <a href="../nodeprop/">node property prediction</a> task<br/>
            </p>
            <p class="lead">
                <b>TKGs and THGs:</b> We include the link property prediction task also for <a href="../tkg/">Temporal Knowledge Graphs</a> and <a href="../thg/">Temporal Heterogeneous Graphs</a>.<br/>
            </p>
            <p class="lead">
                <b>Rich domains:</b> TGB datasets come from interaction networks, rating networks, trasanction networks, traffic networks, social networks, trade networks, political networks, knowledge networks and software networks. <br/>
            </p>
            <p class="lead">
                <b>Diverse in scale:</b> TGB datasets includes <r>small</r>, <b>medium</b> and <g>large</g> scale datasets <br/>
            </p>
        </div>
        <div class="col-md-6 text-center">
            <img src="{{ "/assets/img/dataset_stats.png" | relative_url }}" class="img-responsive">
        </div>
    </div>
</div>
----

#### **Leaderboard Submission**
<p class="lead">
<font size="5">
To submit to TGB datasets, please fill in the following <a href="https://forms.gle/SEsXvN1QHo9tSFwx9">google form</a> and reach out to <a href="shenyang.huang@mail.mcgill.ca">shenyang.huang@mail.mcgill.ca</a> if you have any questions. All results should be reported across 5 runs for both validation and test performance. Rules for the Leaderboard is found <a href="../leader_rules">here</a>.
</font>
</p>



#### **Dataset splits** 
<p class="lead">
<font size="5">
All datasets are split chronologically into the train, validation and test set with 70%, 15% and 15% of the edges respectively </font>
</p>


#### **Exploring datasets** 
<p class="lead">
<font size="5">
You can plot temporal graph statistics or visualizations in our companion Python package: <a href="https://complexdata-mila.github.io/TGX/">TGX</a>. TGX is a Python library designed to analyze and visualize temporal graphs. All TGB datasets are directly supported in TGX, see our <a href="https://complexdata-mila.github.io/TGX/tutorials/data_viz_stats/">example tutorial here</a>.
</font>
</p>


#### **Contributing datasets**
<p class="lead">
<font size="5">TGB welcomes community feedback and contributions, if you would like to contribute a datasets or raise an issue, please reach out <a href="shenyang.huang@mail.mcgill.ca">by email</a>. </font>
</p>



