// Filename : exception.h
//
// ***************************************************************************
// ***************************************************************************

#ifndef _EXCEPTION_H
#define _EXCEPTION_H

// ---------------------------------------------------------------------------
// System Include Files
// ---------------------------------------------------------------------------
#include <stdarg.h>
#include <cstdio>
#include <cstring>

class Exception
{
public :
	char mreason[1024];

	// Default constructor must be
	Exception () 
	{
		strcpy (mreason, "N/A");
	};

	// Constructor : vargs
	Exception (char const *fmt, ...) 
	{
		va_list		argv;
		va_start (argv, fmt);
		vsprintf (mreason, fmt, argv);
		printf("%s\n", mreason);
		va_end (argv);
	};

	// Constructor : assemble with before exception or comment
	Exception (const char *exceptionReason, const char *comment) 
	{
		setReason (exceptionReason, comment);
	};

	void setReason (const char *exceptionReason, const char *comment) 
	{
		int maxInputSize = 1023;
		int	copyOffset = 0;

		if (NULL != exceptionReason) 
		{
			int stringLen = strlen(exceptionReason);
			if (stringLen > maxInputSize) 
			{
				memcpy ((void *)mreason, (const void *)exceptionReason, maxInputSize);
				mreason[maxInputSize] = 0x00;

				copyOffset += maxInputSize;
			}
			else 
			{
				strcpy (mreason, exceptionReason);	
				copyOffset += stringLen;
			};
		};

		if (NULL != comment) 
		{
			int stringLen = strlen(comment);
			int restLen = maxInputSize - copyOffset - 1;
			if (stringLen > restLen) 
			{
				strcat (mreason, "\n");	
				memcpy ((void *)(mreason + copyOffset + 1), (const void *)comment, restLen);
				mreason[maxInputSize] = 0x00;
			}
			else 
			{
				strcat (mreason, "\n");	
				strcat (mreason, comment);	
			};
		};
	};

	const char *getReason () 
	{
		return (mreason);
	};
};

#endif

