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
/*���������ֵ��������Ӧ�ı�ţ��ڶ����������ڱ�ʾ����ֵ�ķ�Χ,������������ʾ��ǰ��ֵ*/

	char b='\0';
	/*�װ���ά���ߣ���Ȼ�˴�����ʹ��switch���ٴ������������Ҳ�������������,������ʹ���쳣�޸�����ò���ô���*/
	if (c<=0) c=1;	/*�쳣�޸���*/	/*���ڽ�����������,�ƺ��޸�������?*/
	if (pressesc==-1) if (a!=27) pressesc = 0;	/*�쳣�޸���*/	/*����ֻ�ܰ�������Esc������*/
	if ((i >= '0') && (i <= '9')) i = i - '1' + 1;	/*�쳣�޸���*/	/*���������ƣ��ڶ�������Ϊ�����ַ�������*/
	//if (27==b) if (a!=b) {a=b;b=_getch();}	/*�쳣�޸���*/	/*�������������ַ���˫��Esc���˳�������*/
	//if (224==b) {a=b;b=_getch();}	/*�쳣�޸���*/	/*�����������ַ����·��������Ӧ������*/
	
	/*��չģ��-�����ǩֱ�ӷ�����Ӧ��ֵ*/
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
	/*��ʾ�б����ܱ�ǲ��ڱ������ӱ��*/
	mark(a, 1);
	printf ("1.��ɱ\n");
	mark(a, 2);
	printf ("2.���ݻָ�\n");
	mark(a, 3);
	printf ("3.������\n");
	mark(a, 4);
	printf ("4.����������\n");
	mark(a, 5);
	printf ("5.����\n");
	mark(a, 6);
	return a;
}

int mark(int a,int b)
{
	/*�����ṩ��ֵ�����Ƿ����ֵ*/
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),7);
	if (a==b) SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),112);
	return 0;
}

void explanation(int i)
{
	/*�����ṩ��ֵ��ʾ��ǰ���ܵĽ���*/
	switch (i) {
	case -1: printf("�ٴΰ���Esc�˳�����");break;
	case 1: printf("��ʼ��ɱ����\n");break;
	case 2: printf("�ָ��豸�б��۸ĵ��ļ�\n"); break;
	case 3: printf("��ѯ���°汾\n"); break;
	case 4: printf("Ϊɨ������������׼��\n"); break;
	case 5: printf("̸̸��ЩĬĬ��������\n"); break;
	}
}