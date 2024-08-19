for histogram record.

1.edit follow file.

<base>/src/misc/base.dbd

include "histogramRecord.dbd"

 

2.edit follow file.

<base>/src/dev/softDev/devSoft.dbd

insert  follow line.

device(histogram, CONSTANT, devHistogramSoft,"Soft Channel")
