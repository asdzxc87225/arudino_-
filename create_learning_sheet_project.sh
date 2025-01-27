#!/bin/bash

# 檢查參數
if [ "$#" -ne 3 ]; then
    echo "用法: $0 <學習單標題> <主題> <輸出目錄名>"
    exit 1
fi

# 接收參數
TITLE=$1
TOPIC=$2
PROJECT_DIR=$3

# 建立專案目錄
mkdir -p "$PROJECT_DIR"

# 生成主文件 main.tex
cat <<EOL > "$PROJECT_DIR/main.tex"
% !TeX program = xelatex
\\documentclass[a4paper,12pt]{article}
\\usepackage[left=2cm,right=2cm,top=2cm,bottom=2cm]{geometry}
\\usepackage{tcolorbox}
\\usepackage{xcolor}
\\usepackage{enumitem}
\\usepackage{fontspec}
\\usepackage{xeCJK}

\\setCJKmainfont{Noto Sans CJK SC}
\\definecolor{headercolor}{RGB}{40, 128, 255}
\\definecolor{contentcolor}{RGB}{220, 240, 220}

% 標題框設計
\\newtcolorbox{headerbox}[1]{
  colframe=headercolor,
  colback=headercolor!20,
  coltitle=headercolor!20!black,
  fonttitle=\\bfseries,
  sharp corners,
  title=#1
}

% 內容框設計
\\newtcolorbox{contentbox}{
  colframe=black!50,
  colback=contentcolor,
  sharp corners,
}

\\begin{document}
\\input{header}

\\input{components}

\\input{requirements}

\\input{design}

\\input{summary}

\\end{document}
EOL

# 生成 header.tex
cat <<EOL > "$PROJECT_DIR/header.tex"
\\begin{center}
    \\Large\\textbf{$TITLE} \\\\[0.5cm]
    \\large 訓練主題：$TOPIC \\\\[0.2cm]
    日期：\\_\\_\\_\\_\\_\\_\\_ \\hfill 學生姓名：\\_\\_\\_\\_\\_\\_\\_
\\end{center}

\\vspace{0.5cm}
EOL

# 生成 components.tex
cat <<EOL > "$PROJECT_DIR/components.tex"
\\begin{headerbox}{1. 使用元件}
請列出學習活動中所需的元件或工具。
\\end{headerbox}
EOL

# 生成 requirements.tex
cat <<EOL > "$PROJECT_DIR/requirements.tex"
\\begin{headerbox}{2. 動作要求}
請描述此次學習活動的目標或操作要求。
\\end{headerbox}
EOL

# 生成 design.tex
cat <<EOL > "$PROJECT_DIR/design.tex"
\\begin{headerbox}{3. 設計}
請詳細描述學習活動的設計與步驟。
\\end{headerbox}
EOL

# 生成 summary.tex
cat <<EOL > "$PROJECT_DIR/summary.tex"
\\begin{headerbox}{4. 心得總結}
請撰寫心得、收穫與改進建議。
\\end{headerbox}
EOL

# 提示完成
echo "學習單 LaTeX 專案已生成: $PROJECT_DIR"
echo "請前往目錄 $PROJECT_DIR 並編譯 main.tex。"

