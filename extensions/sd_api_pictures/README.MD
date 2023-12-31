## Description:
TL;DR: Lets the bot answer you with a picture!  

Stable Diffusion API pictures for TextGen, v.1.2.0  
An extension to [oobabooga's textgen-webui](https://github.com/oobabooga/text-generation-webui) allowing you to receive pics generated by [VivusAI's SD-WebUI API](https://github.com/VivusAI/sd-docker)

<details>
<summary>Interface overview</summary>

![Interface](https://raw.githubusercontent.com/Brawlence/SD_api_pics/main/illust/Interface.jpg)

</details>

Load it in the `--chat` mode with `--extension sd_api_pictures` alongside `send_pictures`
(it's not really required, but completes the picture, *pun intended*).  


## History

Consider the version included with [oobabooga's repository](https://github.com/oobabooga/text-generation-webui/tree/main/extensions/sd_api_pictures) to be STABLE, experimental developments and untested features are pushed in [Brawlence/SD_api_pics](https://github.com/Brawlence/SD_api_pics)

Lastest change:  
1.1.0 → 1.1.1 Fixed not having Auto1111's metadata in received images

## Details

The image generation is triggered:  
- manually through the 'Force the picture response' button while in `Manual` or `Immersive/Interactive` modes OR  
- automatically in `Immersive/Interactive` mode if the words `'send|main|message|me'` are followed by `'image|pic|picture|photo|snap|snapshot|selfie|meme'` in the user's prompt  
- always on in `Picturebook/Adventure` mode (if not currently suppressed by 'Suppress the picture response')  

## Prerequisites

One needs an available instance of VivusAI's webui running with an `--api` flag. Ain't tested with a notebook / cloud hosted one but should be possible.   
To run it locally in parallel on the same machine, specify custom `--listen-port` for either Auto1111's or ooba's webUIs.  

## Features overview
- Connection to API check (press enter in the address box)  
- [VRAM management (model shuffling)](https://github.com/Brawlence/SD_api_pics/wiki/VRAM-management-feature)  
- [Three different operation modes](https://github.com/Brawlence/SD_api_pics/wiki/Modes-of-operation) (manual, interactive, always-on)  
- User-defined persistent settings via settings.json

### Connection check

Insert the VivusAI's WebUI address and press Enter:  
![API-check](https://raw.githubusercontent.com/Brawlence/SD_api_pics/main/illust/API-check.gif)  
Green mark confirms the ability to communicate with Auto1111's API on this address. Red cross means something's not right (the ext won't work).

### Persistents settings

Create or modify the `settings.json` in the `text-generation-webui` root directory to override the defaults
present in script.py, ex:

```json
{
    "sd_api_pictures-manage_VRAM": 1,
    "sd_api_pictures-save_img": 1,
    "sd_api_pictures-prompt_prefix": "(Masterpiece:1.1), detailed, intricate, colorful, (solo:1.1)",
    "sd_api_pictures-sampler_name": "DPM++ 2M Karras"
}
```

will automatically set the `Manage VRAM` & `Keep original images` checkboxes and change the texts in `Prompt Prefix` and `Sampler name` on load.

---

## Demonstrations:

Those are examples of the version 1.0.0, but the core functionality is still the same

<details>
<summary>Conversation 1</summary>

![EXA1](https://user-images.githubusercontent.com/42910943/224866564-939a3bcb-e7cf-4ac0-a33f-b3047b55054d.jpg)
![EXA2](https://user-images.githubusercontent.com/42910943/224866566-38394054-1320-45cf-9515-afa76d9d7745.jpg)
![EXA3](https://user-images.githubusercontent.com/42910943/224866568-10ea47b7-0bac-4269-9ec9-22c387a13b59.jpg)
![EXA4](https://user-images.githubusercontent.com/42910943/224866569-326121ad-1ea1-4874-9f6b-4bca7930a263.jpg)


</details>

<details>
<summary>Conversation 2</summary>

![Hist1](https://user-images.githubusercontent.com/42910943/224865517-c6966b58-bc4d-4353-aab9-6eb97778d7bf.jpg)
![Hist2](https://user-images.githubusercontent.com/42910943/224865527-b2fe7c2e-0da5-4c2e-b705-42e233b07084.jpg)
![Hist3](https://user-images.githubusercontent.com/42910943/224865535-a38d94e7-8975-4a46-a655-1ae1de41f85d.jpg)

</details>

