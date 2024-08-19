#ifndef EVG_SEQUENCE_H
#define EVG_SEQUENCE_H

#include <vector>
#include <string>

#include <epicsTypes.h>
#include <epicsMutex.h>
#include <dbAccess.h>
#include <dbScan.h>

#include <mrfCommon.h>
#include "mrf/object.h"

class evgMrm;
class evgSeqRam;
class evgSeqRamMgr;

enum TimestampInpMode {
    EGU = 0,
    TICKS
};

enum TimestampResolution {
    Seconds = 0,
    MilliSeconds = 3,
    MicroSeconds = 6,
    NanoSeconds = 9
};

enum SeqRunMode {
    Normal = 0,
    Auto,
    Single
};

enum SeqTrigSrc {
    None = 31,
    Mxc0 = 0,
    Mxc1 = 1,
    Mxc2 = 2,
    Mxc3 = 3,
    Mxc4 = 4,
    Mxc5 = 5,
    Mxc6 = 6,
    Mxc7 = 7,
    AC = 16,

    SoftRam0 = 17,
    SoftRam1 = 18,
    Software = 19,

    ExtRam0 = 24,
    ExtRam1 = 25,
    External = 40,

    FrontInp0 = 41,
    FrontInp1 = 45,
    UnivInp0 = 42,
    UnivInp1 = 46,
    UnivInp2 = 50,
    UnivInp3 = 54,
    RearInp0 = 43,
    RearInp1 = 47
};

#define IrqStop(id) irqStop##id

class evgSoftSeq {
public:
    evgSoftSeq(const epicsUInt32, evgMrm* const);
    ~evgSoftSeq();

    const epicsUInt32 getId() const;	

    void setDescription(const char*);
    const char* getDescription();

    void setErr(std::string);
    std::string getErr();

    void setTimestampInpMode(TimestampInpMode);
    TimestampInpMode getTimestampInpMode();

    void setTimestampResolution(TimestampResolution);
    TimestampResolution getTimestampResolution();

    void setTimestamp(epicsUInt64*, epicsUInt32);
    const std::vector<epicsUInt64>& getTimestampCt();

    void setEventCode(epicsUInt8*, epicsUInt32);
    const std::vector<epicsUInt8>& getEventCodeCt();

    void setTrigSrc(SeqTrigSrc);
    SeqTrigSrc getTrigSrcCt();

    void setRunMode(SeqRunMode);
    SeqRunMode getRunModeCt();

    void setSeqRam(evgSeqRam*);
    evgSeqRam* getSeqRam();

    bool isLoaded();
    bool isEnabled();
    bool isCommited();

    void load();
    void unload();
    void commit();
    void enable();
    void disable();
    void abort(bool);
    void pause();
    void sync();
    void finishSync();
    void commitSoftSeq();

    void process_eos();

    void incNumOfRuns();
    void resetNumOfRuns();
    epicsUInt32 getNumOfRuns() const;

    void show(int);

    IOSCANPVT                  ioscanpvt;
    IOSCANPVT                  ioScanPvtErr;
    IOSCANPVT                  iorunscan;
    epicsMutex                 m_lock;

private:
    const epicsUInt32          m_id;
    evgMrm* const              m_owner;
    volatile epicsUInt8* const m_pReg;
    std::string                m_desc;
    std::string                m_err;

    TimestampInpMode           m_timestampInpMode;
    TimestampResolution        m_timestampResolution;

    // scratch copy
    std::vector<epicsUInt64>   m_timestamp; //In Event Clock Ticks
    std::vector<epicsUInt8>    m_eventCode;
    SeqTrigSrc                 m_trigSrc;
    SeqRunMode                 m_runMode;   

    // commited copy
    std::vector<epicsUInt64>   m_timestampCt;
    std::vector<epicsUInt8>    m_eventCodeCt;
    SeqTrigSrc                 m_trigSrcCt;
    SeqRunMode                 m_runModeCt;

    evgSeqRam*                 m_seqRam;
    evgSeqRamMgr*              m_seqRamMgr; 

    bool                       m_isEnabled;
    bool                       m_isCommited;
    bool                       m_isSynced;

    epicsUInt32                m_numOfRuns;
};

extern int mrmEVGSeqDebug;

#endif //EVG_SEQUENCE_H

