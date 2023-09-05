以下基本上就是对你提到的 https://github.com/tuberry/dict-ecdict 的解读

1. 下载词典csv源文件

> https://github.com/skywind3000/ECDICT  
> 最新版数据太大，我已经把数据库压缩成 stardict.7z 了，外面默认的 ecdict.csv 算是一个基础版本（76 万词条）。
```bash
git clone --depth=1 --single-branch -b master git@github.com:skywind3000/ECDICT.git
cd ./ECDICT
7z x ./stardict.7z # 解压缩 stardict.7z文件, 产生一个 stardict.csv 文件
```

2. 用 `dict-ecdict` 仓库提供的的工具将 EDICT csv字典 转化成 [Jargon File](https://www.wikiwand.com/en/Jargon_File) 格式

```bash
cd ..
git clone --depth=1 --single-branch -b master git@github.com:tuberry/dict-ecdict.git

cd ./ECDICT
../dict-ecdict/cli/gen-ecdict.py --help # 帮助信息
../dict-ecdict/cli/gen-ecdict.py -i ./stardict.csv -o stardict.txt --no-mini # 转换

```

3. 将 `Jargon File` 格式文件转化成 `DICT` 文件, 以及添加字典

参考 https://www.wikiwand.com/en/DICT#Dict_file_format

```bash
# 最终转换
dictfmt --utf8 --allchars -s "ecdict" -j ecdict < ./stardict.txt
dictzip ecdict.dict # 压缩字典文件，得到 ecdict.dict.dz 文件

# 移动字典文件到 dictd 目录
sudo mv ecdict.dict.dz ecdict.index /usr/share/dictd/
```

在 `/etc/dict/dictd.conf` 最后一行添加我们的词典
```
database ecdict {
	data /usr/share/dictd/ecdict.dict.dz
	index /usr/share/dictd/ecdict.index
}
```

重启 `dictd` 服务

```bash
sudo systemctl restart dictd.service
```

4. 测试

```bash
dict -D # 列出所有词典

dict -d ecdict emacs
#From ecdict [ecdict]:
#
#  EMACS
#  
#  [T] EMACS，即 Editor MACroS（编辑器宏）的缩写，最初由 Richard Stallman(理查德·马修·斯托曼)于
#  1975年在 MIT协同Guy Steele共同完成，被公认为是最受专业程序员喜爱的代码编辑器之一，另外一个vim。
```

