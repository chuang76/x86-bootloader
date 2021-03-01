void entry_point()
{

}

void main()
{
	char *video_mem = (char *)0xb8000; 
	*video_mem = 'X';
	entry_point(); 
}
