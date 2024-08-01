---
title: Get Started
permalink: /docs/home/
redirect_from: /docs/index.html
---

### DASB: Discrete Audio and Speech Benchmark

Overview of the Discrete Audio and Speech Benchmark (DASB) pipeline:
- DASB includes a diverse set of discrete audio encoders from all three categories: semantic(Discrete HuBERT, Discrete WavLM, Discrete Wav2Vec2), compression(EnCodec, DAC), and hybrid(SpeechTokenizer).
- DASB supports a wide range of discriminative tasks, including speech, speaker, emotion recognition, keyword spotting, and intent classification. It also includes generative tasks, such as speech enhancement, separation, and text-to-speech.
- For a more reliable assessment, twodifferent downstream architectures are considered for each task.
- Novel audio tokenizer can be easily evaluated on DASB benchmark via reproducible and realistic evaluation protocols. 

### ▶️ Quickstart

#### Running a single task

If you have specific discrete model and want to benchmark it for a specific task, you need to run the following command:
   ```
   python LibriSpeech/ASR/LSTM/train_[tokenzier_name].py LibriSpeech/ASR/LSTM/hparams/train_[tokenzier_name].yaml --output_folder my-output-folder --data_folder mypath/to/LibriSpeech
   ```

#### Running multiple tasks

To run all tasks, make the following changes:

1. Edit the `run_discriminative_benchmark.sh` and `run_genarative_benchmark.sh` files and modify tokenizer related values for example the bitrate , number of codebooks, and etc.
2. Choose a set of tasks from the provided list and, for each task, select a downstream architecture from the available options (see list below).
3. Update the variables defined in `run_benchmark.sh` with two lists of equal size. In the `ConsideredTasks` list, specify the tasks you want to run (e.g., `'LibriSpeechASR' 'LibriSpeechASR' 'IEMOCAP'`). In the `Downstreams` list, specify the corresponding downstream architecture for each task (e.g., `'BiLSTM'`, `contextnet`, `'ecapa_tdnn'`).

   For example, if you set `ConsideredTasks=('LibriSpeechASR' 'LibriSpeechASR' 'IEMOCAP')` and `Downstreams=('BiLSTM', 'contextnet', 'ecapa_tdnn')`, the benchmark will be executed as follows:
   - LibriSpeechASR with BiLSTM as the probing head
   - LibriSpeechASR with contextnet as the probing head
   - IEMOCAP with ecapa_tdnn as the probing head.

3. Run the following command:
   ```
   bash run_discriminative_benchmark.sh [tokenzier_name]
   bash run_genarative_benchmark.sh [tokenzier_name]
   ```
   You could also pass extra arguments as far as they are consistent  across all tasks.

   For generative task, make sure to set the `utmos_path` required for TTS evaluation.
### 📝 ‍Incorporating Your Audio Tokenizer

Let's now assume you've designed an audio and speech tokenizer in PyTorch and wish to integrate it into our benchmark.
You're in luck because we've made this step as simple as possible for you!
Here are the steps you should follow:

1. Write your model's code in a Python library saved in `benchmarks/DASB/model` (e.g., `benchmarks/MOABB/models/my_model.py`).

2. Create a YAML and py file for each task you want to experiment with. Thankfully, you don't have to start from scratch. For example, if you're working with LibriSpeech/ASR/LSTM, copy `benchmarks/DASB/LibriSpeech/ASR/contextnet/hparams/train_encodec.yaml` and save it in the same folder with a different name (e.g., `train_my_model.yaml` and `train_my_model.py`).

3. Edit the relevant section of your `train_my_model.yaml` and `train_my_model.py`. Redefine the `codec:` to reference your custom model (e.g., `codec: !new:models.my_model.my_model`).

4. Ensure you include the hyperparameters specific to your model.

5. Now, follow the instructions above to run an experiments across tasks.
**Note**: If you're not familiar with YAML, you can refer to our [HyperPyYAML tutorial](https://speechbrain.github.io/tutorial_basics.html) on the SpeechBrain website for guidance.


<!-- 
## Getting started

[GitHub Pages](https://pages.github.com) can automatically generate and serve the website for you.
Let's say you have a username/organisation `my-org` and project `my-proj`; if you locate Jekyll source under `docs` folder of master branch in your repo `github.com/my-org/my-proj`, the website will be served on `my-org.github.io/my-proj`.
The good thing about coupling your documentation with the source repo is, whenever you merge features with regarding content to master branch, it will also be published on the webpage instantly.

1. Just [download the source](https://github.com/aksakalli/jekyll-doc-theme/archive/gh-pages.zip) into your repo under `docs` folder.
2. Edit site settings in  `_config.yml` file according to your project. !!! `baseurl` should be your website's relative URI like `/my-proj` !!!
3. Replace `favicon.ico` and `assets/img/TGB_nav.png` with your own logo.

## Writing content

### Docs

Docs are [collections](https://jekyllrb.com/docs/collections/) of pages stored under `_docs` folder. To create a new page:

**1.** Create a new Markdown as `_docs/my-page.md` and write [front matter](https://jekyllrb.com/docs/frontmatter/) & content such as:

```
---
title: My Page
permalink: /docs/my-page/
---

Hello World!
```

**2.** Add the pagename to `_data/docs.yml` file in order to list in docs navigation panel:

```
- title: My Group Title
  docs:
  - my-page
```

### Blog posts

Add a new Markdown file such as `2017-05-09-my-post.md` and write the content similar to other post examples.

### Pages

The homepage is located under `index.html` file. You can change the content or design completely different welcome page for your taste. (You can use [bootstrap components](http://getbootstrap.com/components/))

In order to add a new page, create a new `.html` or `.md` (markdown) file under root directory and link it in `_includes/topnav.html`. -->
