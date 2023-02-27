class Balance{
    static boolean[]r=new boolean[4];
    static int n=1; //Start at one to avoid out of bounds exceptions (also means we waste *one* space in the array)
    static byte[]s;
    static int i=0;

    public static void main(String[]a)throws Exception{
        s=System.in.readAllBytes();
        System.out.println(l());
    }

    public static void main(String input)throws Exception{
        r=new boolean[4];
        n=1;
        s=input.getBytes();
        i=0;
        System.out.println(l());
    }
    
    static int l(){
        do{
            switch(s[i++]){
                case'(':
                    r[n]=true;
                case'[':
                    n++;
                    break;
                case')':
                    if(r[--n]==false) return 0;
                    else r[n]=false;
                    break;
                case']':
                    if(r[--n]==true) return 0;
            }
            if(n<1)return 0;
            if(n==r.length){
                var t=new boolean[r.length*4];
                System.arraycopy(r, 0, t, 0, r.length);
                r=t;
            }
        }while(i<s.length);
        return n==1?1:0;
    }
}
