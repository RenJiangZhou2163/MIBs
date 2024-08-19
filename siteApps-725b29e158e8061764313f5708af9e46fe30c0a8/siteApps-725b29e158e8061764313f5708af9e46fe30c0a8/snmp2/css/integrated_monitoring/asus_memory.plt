<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<databrowser>
    <title>   </title>
    <save_changes>true</save_changes>
    <show_legend>false</show_legend>
    <show_toolbar>false</show_toolbar>
    <grid>true</grid>
    <scroll>true</scroll>
    <update_period>3.0</update_period>
    <scroll_step>5</scroll_step>
    <start>-1 minutes 0.0 seconds</start>
    <end>now</end>
    <archive_rescale>NONE</archive_rescale>
    <background>
        <red>255</red>
        <green>255</green>
        <blue>255</blue>
    </background>
    <title_font>Droid Sans|16|0</title_font>
    <label_font>Droid Sans|9|0</label_font>
    <scale_font>Droid Sans|9|0</scale_font>
    <legend_font>Droid Sans|9|0</legend_font>
    <axes>
        <axis>
            <visible>true</visible>
            <name>Mem (Kib)</name>
            <use_axis_name>true</use_axis_name>
            <use_trace_names>false</use_trace_names>
            <right>false</right>
            <color>
                <red>0</red>
                <green>0</green>
                <blue>0</blue>
            </color>
            <min>100000.0</min>
            <max>500000.0</max>
            <grid>false</grid>
            <autoscale>false</autoscale>
            <log_scale>false</log_scale>
        </axis>
        <axis>
            <visible>false</visible>
            <name>Value 2</name>
            <use_axis_name>false</use_axis_name>
            <use_trace_names>true</use_trace_names>
            <right>false</right>
            <color>
                <red>0</red>
                <green>0</green>
                <blue>0</blue>
            </color>
            <min>100000.0</min>
            <max>500000.0</max>
            <grid>false</grid>
            <autoscale>false</autoscale>
            <log_scale>false</log_scale>
        </axis>
        <axis>
            <visible>true</visible>
            <name>Buffer (Kib)</name>
            <use_axis_name>true</use_axis_name>
            <use_trace_names>false</use_trace_names>
            <right>false</right>
            <color>
                <red>0</red>
                <green>0</green>
                <blue>0</blue>
            </color>
            <min>0.0</min>
            <max>1000.0</max>
            <grid>false</grid>
            <autoscale>false</autoscale>
            <log_scale>false</log_scale>
        </axis>
    </axes>
    <annotations>
    </annotations>
    <pvlist>
        <pv>
            <display_name>Kib Mem : Real</display_name>
            <visible>true</visible>
            <name>ASUS:mem_Total_Real</name>
            <axis>0</axis>
            <color>
                <red>255</red>
                <green>0</green>
                <blue>0</blue>
            </color>
            <trace_type>AREA</trace_type>
            <linewidth>2</linewidth>
            <point_type>NONE</point_type>
            <point_size>2</point_size>
            <waveform_index>0</waveform_index>
            <period>0.0</period>
            <ring_size>5000000</ring_size>
            <request>OPTIMIZED</request>
            <archive>
                <name>RDB</name>
                <url>jdbc:mysql://localhost/archive</url>
                <key>1</key>
            </archive>
            <archive>
                <name>- All -</name>
                <url>xnds://localhost/archive/cgi/ArchiveDataServer.cgi</url>
                <key>1</key>
            </archive>
        </pv>
        <pv>
            <display_name>Kib Mem : Free</display_name>
            <visible>true</visible>
            <name>ASUS:mem_Total_Free</name>
            <axis>1</axis>
            <color>
                <red>0</red>
                <green>143</green>
                <blue>19</blue>
            </color>
            <trace_type>AREA</trace_type>
            <linewidth>2</linewidth>
            <point_type>NONE</point_type>
            <point_size>2</point_size>
            <waveform_index>0</waveform_index>
            <period>0.0</period>
            <ring_size>5000000</ring_size>
            <request>OPTIMIZED</request>
            <archive>
                <name>RDB</name>
                <url>jdbc:mysql://localhost/archive</url>
                <key>1</key>
            </archive>
            <archive>
                <name>- All -</name>
                <url>xnds://localhost/archive/cgi/ArchiveDataServer.cgi</url>
                <key>1</key>
            </archive>
        </pv>
        <pv>
            <display_name>Kib Mem : Buffer</display_name>
            <visible>true</visible>
            <name>ASUS:mem_Total_Buffer</name>
            <axis>2</axis>
            <color>
                <red>160</red>
                <green>32</green>
                <blue>240</blue>
            </color>
            <trace_type>AREA</trace_type>
            <linewidth>2</linewidth>
            <point_type>NONE</point_type>
            <point_size>2</point_size>
            <waveform_index>0</waveform_index>
            <period>0.0</period>
            <ring_size>5000000</ring_size>
            <request>OPTIMIZED</request>
            <archive>
                <name>RDB</name>
                <url>jdbc:mysql://localhost/archive</url>
                <key>1</key>
            </archive>
            <archive>
                <name>- All -</name>
                <url>xnds://localhost/archive/cgi/ArchiveDataServer.cgi</url>
                <key>1</key>
            </archive>
        </pv>
    </pvlist>
</databrowser>