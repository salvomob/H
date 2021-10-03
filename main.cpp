#include<iostream>
#include<cstring>
#include<unistd.h>

using namespace std;

void encode(char*);
void printAscii();
void decode(char*);
void stampa(char*);

int main()
{
    //printAscii();
    string line;
    getline(cin,line);
    int dim = line.length();
    char *a = new char(dim);
    for(int i = 0; i< dim;i++) a[i] = line[i];
    stampa(a);
    encode(a);
    stampa(a);

    decode(a);
    //encode(a);
    stampa(a);
    /*for(int i = 0; i < 3; i++)
    {
        cout << a[i] << " ";
    }
    cout << endl;*/
}

void encode(char *arr)
{
    size_t l = strlen(arr);
    int mediana = 80;
    for(int i = 0; i < l; i++)
    {
       // if(arr[i] < 32 || arr[i] >128) continue;
        char c = arr[i];
        if(c < mediana)
        {
            int diff = mediana - arr[i];
            c = mediana+diff;
           // cout << arr[i] << " to " <<c<< endl;
            continue;
        }
        if(c > mediana)
        {
            int diff = arr[i] - mediana;
            c = mediana-diff;
          //  cout << arr[i] << " to " <<c<< endl;
            arr[i] = c;
            continue;
        }

    }

}



void decode(char *arr)
{
    size_t l = strlen(arr);
    int mediana = 80;
     int repetitions = 0;
    for(int i = 0; i < l; i++)
    {

        if(arr[i] <= 32 || arr[i] >=128) continue;
        char c = arr[i];
        if(c < mediana)
        {
            int diff = mediana - arr[i];
            c = mediana+diff;
           // cout << arr[i] << " to " <<c<< endl;
            arr[i] = c;
            repetitions++;
            continue;
        }
        if(c > mediana)
        {
            int diff = arr[i] - mediana;
            c = mediana-diff;
          //  cout << arr[i] << " to " <<c<< endl;
            arr[i] = c;
            repetitions++;
            continue;
        }

    }
    cout << repetitions << endl;
}
void printAscii()
{
    int n = 0;
    for(char i = ' '; i <= '~'; i++)
    {
        std::cout << i << ((i % 16 == 15) ? '\n' : ' ');
        n++;
    }

    std::cout << n << "\n";

}

void stampa(char *arr)
{
    size_t l = strlen(arr);
    for(int i = 0; i < l; i++)
    {
        cout << arr[i];// << " ";
    }
    cout << endl;
}
