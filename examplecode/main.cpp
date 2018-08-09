#include <boost/scoped_ptr.hpp>
#include <boost/smart_ptr.hpp>
#include <iostream>


int main()
{
	return 0;
}

void forward_null_example1(int *p) {
	int x;
	if ( p == NULL ) {
		x = 0;
	}
	
	*p = x; // Defect: p is potentially NULL
}

