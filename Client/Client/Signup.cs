using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Security.Cryptography;

namespace Client
{
    public partial class Signup : Form
    {
        private TcpClient tc;
        //声明网络流
        private NetworkStream ns;
        private BinaryReader br;
        private BinaryWriter bw;
        private String IP;
        private String port;
        public Signup()
        {
            InitializeComponent();
            IP = "127.0.0.1";
            port = "9999";
            this.Text = "注册";
        }

        private void btn_signup_Click(object sender, EventArgs e)
        {
            if (tb_account.Text == "")
            {
                lb_status.Text = "账号不能为空";
                return;
            }
            if (tb_passwd.Text == "")
            {
                lb_status.Text = "密码不能为空";
                return;
            }
            if (tb_passwd.Text != tb_passwdrpt.Text)
            {
                lb_status.Text = "两次密码不一致";
                return;
            }
            if (tb_username.Text == "")
            {
                lb_status.Text = "昵称不能为空";
                return;
            }
            string account = tb_account.Text.Trim();
            string username = tb_username.Text.Trim();
            string password = tb_passwd.Text.Trim();
            string new_password = null;

            StringBuilder sb = new StringBuilder();

            //对密码加密

            using (MD5 mi = MD5.Create())
            {
                //开始加密
                byte[] newBuffer = mi.ComputeHash(System.Text.Encoding.Unicode.GetBytes(password));
                StringBuilder stringb = new StringBuilder();
                for (int i = 0; i < newBuffer.Length; i++)
                {
                    stringb.Append(newBuffer[i].ToString("x2"));
                }
                new_password = stringb.ToString();
            }

            sb.Append("signup#");
            sb.Append(account + "#" + new_password + "#" + username);

            try
            {
                lb_status.Text = "正在连接到主机";
                tc = new TcpClient(IP, int.Parse(port));
                //实例化网络流对象
                ns = tc.GetStream();
                br = new BinaryReader(ns);
                bw = new BinaryWriter(ns);
                bw.Write(sb.ToString());
                bw.Flush();
                string info = null;
                try
                {
                    info = br.ReadString();
                }
                catch (Exception)
                {
                    lb_status.Text = "服务器无响应";
                }
                if (info == null)
                {
                    lb_status.Text = "注册失败";
                }
                else
                {
                    lb_status.Text = info;

                }
            }
            catch
            {
                lb_status.Text = "无法连接到主机";
            }
        }

        private void btn_close_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Signup_Load(object sender, EventArgs e)
        {
            this.tb_passwd.PasswordChar = '*';
            this.tb_passwdrpt.PasswordChar = '*';
        }
    }
}
