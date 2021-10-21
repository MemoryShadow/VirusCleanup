#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <windows.h>

int inspection(char a,int i,int c);
int list(int a);
int mark(int a,int b);
void explanation(int i);

int pressesc = 0;

int main()
{
	char a='\0';
	int i=1;
    system ("mode con cols=80 lines=25");
	while (i){
		list(i);
		printf("-------------------------------------------------------------------------------\n");
		explanation(i);
		a=_getch();
		system ("cls");
		i=inspection (a,'5',i);
		if (13==a) return i;
	}
    return 0;
}

int inspection(char a,int i,int c)
{
/*接受输入的值并返回相应的标号，第二个参数用于表示返回值的范围,第三个参数表示当前的值*/

	char b='\0';
	/*亲爱的维护者，虽然此处可以使用switch减少代码量，但是我不建议你这样做,这样会使得异常修复条变得不那么灵活*/
	if (c<=0) c=1;	/*异常修复条*/	/*用于解决下溢出问题,似乎修复了两次?*/
	if (pressesc==-1) if (a!=27) pressesc = 0;	/*异常修复条*/	/*处理只能按下两次Esc的问题*/
	if ((i >= '0') && (i <= '9')) i = i - '1' + 1;	/*异常修复条*/	/*处理传入限制（第二参数）为数字字符的问题*/
	//if (27==b) if (a!=b) {a=b;b=_getch();}	/*异常修复条*/	/*处理输入随意字符后双击Esc不退出的问题*/
	//if (224==b) {a=b;b=_getch();}	/*异常修复条*/	/*处理按下任意字符后按下方向键无响应的问题*/
	
	/*拓展模块-输入标签直接返回相应的值*/
	if (('1'<=a)&&((i+'1'-1)>=a)){
		switch (a) {
		case '0': return 0;
		case '1': return 1;
		case '2': return 2;
		case '3': return 3;
		case '4': return 4;
		case '5': return 5;
		case '6': return 6;
		case '7': return 7;
		case '8': return 8;
		case '9': return 9;
		}
	}

	switch (a) {
	case 27: if (pressesc == 0) { pressesc = -1; c = pressesc; }
			 else if (pressesc == -1) { pressesc = 0; c = pressesc; } break;
		case -32: 
		case 224: {
			switch (b=_getch()){
			case 75:
			case 72: c--;
				if (c <= 0) {
					c = i;
				}
				break;
			case 77:
			case 80: c++;
				if (c >= i + 1) {
					c = 1;
				}
				break;
			}break;
		}
	}
	return c%(i+1);
}

int list(int a)
{
	/*显示列表，接受标记并在标记行添加标记*/
	mark(a, 1);
	printf ("1.查杀\n");
	mark(a, 2);
	printf ("2.数据恢复\n");
	mark(a, 3);
	printf ("3.检查更新\n");
	mark(a, 4);
	printf ("4.导入特征库\n");
	mark(a, 5);
	printf ("5.关于\n");
	mark(a, 6);
	return a;
}

int mark(int a,int b)
{
	/*根据提供的值决定是否加上值*/
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),7);
	if (a==b) SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),112);
	return 0;
}

void explanation(int i)
{
	/*根据提供的值显示当前功能的解释*/
	switch (i) {
	case -1: printf("再次按下Esc退出程序");break;
	case 1: printf("开始查杀病毒\n");break;
	case 2: printf("恢复设备中被篡改的文件\n"); break;
	case 3: printf("查询最新版本\n"); break;
	case 4: printf("为扫描其他病毒做准备\n"); break;
	case 5: printf("谈谈那些默默付出的人\n"); break;
	}
}