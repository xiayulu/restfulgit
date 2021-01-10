FROM python:3.7

WORKDIR /restfulgit

COPY requirements.txt .

RUN pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

COPY . .

RUN python setup.py install

CMD ["gunicorn", "restfulgit.app:application", "-c", "./gunicorn.conf.py"]
