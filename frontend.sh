echo -e "${color} Installing Nginx \e[0m"
dnf install nginx -y

echo -e "${color} Copy Expense Config file \e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf

echo -e "${color} Clean Old Nginx Content \e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "${color} Download Frontend Application Code \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip

echo -e "${color} Extract Downloaded Application Content \e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo -e "${color} Starting Nginx Service \e[0m"
systemctl enable nginx
systemctl restart nginx
