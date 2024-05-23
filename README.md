# Aebel's Notes 

All my notes be here

## Setup project
1. Create virtual environment for project
```
python -m venv .venv
```

2. Activate the virtual environment:
  * Windows:
    ```
    venv\Scripts\activate
    ```
  * For macOS/Linux:
    ```
    source venv/bin/activate
    ```

3. Install required dependencies:
```
pip install -r requirements.txt
```
## Using [mkdocs](https://www.mkdocs.org/getting-started/)

* `mkdocs serve` To run dev server
* `mkdocs build` To build website in ./site/ folder