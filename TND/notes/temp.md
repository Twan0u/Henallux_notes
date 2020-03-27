temp 

```c
#include <stdio.h>

int main(void) {
    FILE *fp = fopen("sample.csv", "r");
    char buf[1024];

    if (!fp) {
        printf("Can't open file\n");
        return 1;
    }

    while (fgets(buf, 1024, fp)) {
        printf("%s\n", buf);
    }

    fclose(fp);

    return 0;
}
```

```mermaid
graph TB

    subgraph UI
    	main
    end
    
    subgraph classificationStatistics
        researchClasses
        displayResultsForEachClasses
        displayAccuracy
        displayBarChart
    end
    
    researchClasses-->main
    displayResultsForEachClasses-->main
    displayAccuracy-->main
    displayBarChart-->main
	
    subgraph dao
    	readCsv
    end
    files(files.csv)-->readCsv
        readCsv-->researchClasses
        readCsv-->displayResultsForEachClasses
        readCsv-->displayAccuracy
        readCsv-->displayBarChart
```

