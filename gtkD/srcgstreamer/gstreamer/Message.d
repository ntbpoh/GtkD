/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
 
// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage

/*
 * Conversion parameters:
 * inFile  = gstreamer-GstMessage.html
 * outPack = gstreamer
 * outFile = Message
 * strct   = GstMessage
 * realStrct=
 * ctorStrct=
 * clss    = Message
 * interf  = 
 * class Code: Yes
 * interface Code: No
 * template for:
 * extend  = 
 * implements:
 * prefixes:
 * 	- gst_message_
 * 	- gst_
 * omit structs:
 * omit prefixes:
 * omit code:
 * 	- gst_message_parse_tag
 * 	- gst_message_type_to_quark
 * 	- gst_message_new_element
 * 	- gst_message_new_new_clock
 * 	- gst_message_new_segment_done
 * 	- gst_message_new_segment_start
 * 	- gst_message_new_warning
 * 	- gst_message_new_state_dirty
 * 	- gst_message_new_eos
 * 	- gst_message_new_error
 * 	- gst_message_new_info
 * imports:
 * 	- glib.Str
 * 	- glib.Quark
 * 	- gstreamer.Structure
 * 	- gstreamer.ObjectGst
 * 	- gstreamer.Clock
 * 	- glib.ErrorG
 * 	- gstreamer.TagList
 * structWrap:
 * 	- GError* -> ErrorG
 * 	- GQuark -> Quark
 * 	- GstClock* -> Clock
 * 	- GstMessage* -> Message
 * 	- GstObject* -> ObjectGst
 * 	- GstStructure* -> Structure
 * 	- GstTagList* -> TagList
 * module aliases:
 * local aliases:
 */

module gstreamer.Message;

private import gstreamerc.gstreamertypes;

private import gstreamerc.gstreamer;

private import glib.Str;
private import glib.Quark;
private import gstreamer.Structure;
private import gstreamer.ObjectGst;
private import gstreamer.Clock;
private import glib.ErrorG;
private import gstreamer.TagList;



/**
 * Description
 * Messages are implemented as a subclass of GstMiniObject with a generic
 * GstStructure as the content. This allows for writing custom messages without
 * requiring an API change while allowing a wide range of different types
 * of messages.
 * Messages are posted by objects in the pipeline and are passed to the
 * application using the GstBus.
 * The basic use pattern of posting a message on a GstBus is as follows:
 * Example11.Posting a GstMessage
 *  gst_bus_post (bus, gst_message_new_eos());
 * A GstElement usually posts messages on the bus provided by the parent
 * container using gst_element_post_message().
 * Last reviewed on 2005-11-09 (0.9.4)
 */
public class Message
{
	
	/** the main Gtk struct */
	protected GstMessage* gstMessage;
	
	
	public GstMessage* getMessageStruct()
	{
		return gstMessage;
	}
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMessage;
	}
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GstMessage* gstMessage)
	{
		this.gstMessage = gstMessage;
	}
	
	/**
	 * Get the type of the message.
	 */
	public GstMessageType type()
	{
		return getMessageStruct().type;
	}
	
	/**
	 * Get the src (the element that originated the message) of the message.
	 */
	public ObjectGst src()
	{
		return new ObjectGst( cast(GstObject*)getMessageStruct().src );
	}
	
	/**
	 * Get the structure.
	 */
	public Structure structure()
	{
		return new Structure( getMessageStruct().structure );
	}
	
	/**
	 * Extracts the tag list from the GstMessage. The tag list returned in the
	 * output argument is a copy; the caller must free it when done.
	 * MT safe.
	 * message:
	 *  A valid GstMessage of type GST_MESSAGE_TAG.
	 * tag_list:
	 *  Return location for the tag-list.
	 */
	/*public void parseTag(GstTagList** tagList)
	{
		// void gst_message_parse_tag (GstMessage *message,  GstTagList **tag_list);
		gst_message_parse_tag(gstMessage, tagList);
	}*/
	public TagList parseTag()
	{
		// void gst_message_parse_tag (GstMessage *message,  GstTagList **tag_list);
		GstTagList* tag_list_c;
		gst_message_parse_tag(gstMessage, &tag_list_c);
		return new TagList(tag_list_c);
	}
	
	//I'm not so sure about the following:
	/**
	 * Get the unique quark for the given message type.
	 * type:
	 *  the message type
	 * Returns:
	 *  the quark associated with the message type
	 */
	public static Quark typeToQuark(GstMessageType type)
	{
		// GQuark gst_message_type_to_quark (GstMessageType type);
		return new Quark( cast(uint*)gst_message_type_to_quark(type) );
	}
	
	/**
	 * Create a new element-specific message. This is meant as a generic way of
	 * allowing one-way communication from an element to an application, for example
	 * "the firewire cable was unplugged". The format of the message should be
	 * documented in the element's documentation. The structure field can be NULL.
	 * src:
	 *  The object originating the message.
	 * structure:
	 *  The structure for the message. The message will take ownership of
	 * the structure.
	 * Returns:
	 *  The new element message.
	 * MT safe.
	 */
	public static Message newElement(ObjectGst src, Structure structure)
	{
		// GstMessage* gst_message_new_element (GstObject *src,  GstStructure *structure);
		return new Message(cast(GstMessage*)gst_message_new_element((src is null) ? null : src.getObjectGstStruct(), (structure is null) ? null : structure.getStructureStruct()) );
	}
	
	/**
	 * Create a new clock message. This message is posted whenever the
	 * pipeline selectes a new clock for the pipeline.
	 * src:
	 *  The object originating the message.
	 * clock:
	 *  the new selected clock
	 * Returns:
	 *  The new new clock message.
	 * MT safe.
	 */
	public static Message newNewClock(ObjectGst src, Clock clock)
	{
		// GstMessage* gst_message_new_new_clock (GstObject *src,  GstClock *clock);
		return new Message(cast(GstMessage*)gst_message_new_new_clock((src is null) ? null : src.getObjectGstStruct(), (clock is null) ? null : clock.getClockStruct()) );
	}
	
	/**
	 * Create a new segment done message. This message is posted by elements that
	 * finish playback of a segment as a result of a segment seek. This message
	 * is received by the application after all elements that posted a segment_start
	 * have posted the segment_done.
	 * src:
	 *  The object originating the message.
	 * format:
	 *  The format of the position being done
	 * position:
	 *  The position of the segment being done
	 * Returns:
	 *  The new segment done message.
	 * MT safe.
	 */
	public static Message newSegmentDone(ObjectGst src, GstFormat format, long position)
	{
		// GstMessage* gst_message_new_segment_done (GstObject *src,  GstFormat format,  gint64 position);
		return new Message(cast(GstMessage*)gst_message_new_segment_done((src is null) ? null : src.getObjectGstStruct(), format, position) );
	}
	
	/**
	 * Create a new segment message. This message is posted by elements that
	 * start playback of a segment as a result of a segment seek. This message
	 * is not received by the application but is used for maintenance reasons in
	 * container elements.
	 * src:
	 *  The object originating the message.
	 * format:
	 *  The format of the position being played
	 * position:
	 *  The position of the segment being played
	 * Returns:
	 *  The new segment start message.
	 * MT safe.
	 */
	public static Message newSegmentStart(ObjectGst src, GstFormat format, long position)
	{
		// GstMessage* gst_message_new_segment_start (GstObject *src,  GstFormat format,  gint64 position);
		return new Message(cast(GstMessage*)gst_message_new_segment_start((src is null) ? null : src.getObjectGstStruct(), format, position) );
	}
	
	/**
	 * Create a new warning message. The message will make copies of error and
	 * debug.
	 * src:
	 *  The object originating the message.
	 * error:
	 *  The GError for this message.
	 * debug:
	 *  A debugging string for something or other.
	 * Returns:
	 *  The new warning message.
	 * MT safe.
	 */
	public static Message newWarning(ObjectGst src, ErrorG error, char[] dbug)
	{
		// GstMessage* gst_message_new_warning (GstObject *src,  GError *error,  gchar *debug);
		return new Message(cast(GstMessage*)gst_message_new_warning((src is null) ? null : src.getObjectGstStruct(), (error is null) ? null : error.getErrorGStruct(), Str.toStringz(dbug)) );
	}
	
	/**
	 * Create a state dirty message. This message is posted whenever an element
	 * changed its state asynchronously and is used internally to update the
	 * states of container objects.
	 * src:
	 *  the object originating the message
	 * Returns:
	 *  The new state dirty message.
	 * MT safe.
	 */
	public static Message newStateDirty(ObjectGst src)
	{
		// GstMessage* gst_message_new_state_dirty (GstObject *src);
		return new Message(cast(GstMessage*)gst_message_new_state_dirty((src is null) ? null : src.getObjectGstStruct()) );
	}
	
	/**
	 * Create a new eos message. This message is generated and posted in
	 * the sink elements of a GstBin. The bin will only forward the EOS
	 * message to the application if all sinks have posted an EOS message.
	 * src:
	 *  The object originating the message.
	 * Returns:
	 *  The new eos message.
	 * MT safe.
	 */
	public static Message newEOS(ObjectGst src)
	{
		// GstMessage* gst_message_new_eos (GstObject *src);
		return new Message(cast(GstMessage*)gst_message_new_eos((src is null) ? null : src.getObjectGstStruct()) );
	}
	
	/**
	 * Create a new error message. The message will copy error and
	 * debug. This message is posted by element when a fatal event
	 * occured. The pipeline will probably (partially) stop. The application
	 * receiving this message should stop the pipeline.
	 * src:
	 *  The object originating the message.
	 * error:
	 *  The GError for this message.
	 * debug:
	 *  A debugging string for something or other.
	 * Returns:
	 *  The new error message.
	 * MT safe.
	 */
	public static Message newError(ObjectGst src, ErrorG error, char[] dbug)
	{
		// GstMessage* gst_message_new_error (GstObject *src,  GError *error,  gchar *debug);
		return new Message(cast(GstMessage*)gst_message_new_error((src is null) ? null : src.getObjectGstStruct(), (error is null) ? null : error.getErrorGStruct(), Str.toStringz(dbug)) );
	}
	
	/**
	 * Create a new info message. The message will make copies of error and
	 * debug.
	 * src:
	 *  The object originating the message.
	 * error:
	 *  The GError for this message.
	 * debug:
	 *  A debugging string for something or other.
	 * Returns:
	 *  The new info message.
	 * Since 0.10.12
	 * MT safe.
	 */
	public static Message newInfo(ObjectGst src, ErrorG error, char[] dbug)
	{
		// GstMessage* gst_message_new_info (GstObject *src,  GError *error,  gchar *debug);
		return new Message(cast(GstMessage*)gst_message_new_info((src is null) ? null : src.getObjectGstStruct(), (error is null) ? null : error.getErrorGStruct(), Str.toStringz(dbug)) );
	}
	
	/**
	 */
	
	
	
	
	
	
	
	
	
	/**
	 * Get a printable name for the given message type. Do not modify or free.
	 * type:
	 *  the message type
	 * Returns:
	 *  a reference to the static name of the message.
	 */
	public static char[] typeGetName(GstMessageType type)
	{
		// const gchar* gst_message_type_get_name (GstMessageType type);
		return Str.toString(gst_message_type_get_name(type) );
	}
	
	
	/**
	 * Access the structure of the message.
	 * message:
	 *  The GstMessage.
	 * Returns:
	 *  The structure of the message. The structure is still
	 * owned by the message, which means that you should not free it and
	 * that the pointer becomes invalid when you free the message.
	 * MT safe.
	 */
	public Structure getStructure()
	{
		// const GstStructure* gst_message_get_structure  (GstMessage *message);
		return new Structure( gst_message_get_structure(gstMessage) );
	}
	
	
	/**
	 * Create a new application-typed message. GStreamer will never create these
	 * messages; they are a gift from us to you. Enjoy.
	 * src:
	 *  The object originating the message.
	 * structure:
	 *  The structure for the message. The message will take ownership of
	 * the structure.
	 * Returns:
	 *  The new application message.
	 * MT safe.
	 */
	public this (ObjectGst src, Structure structure)
	{
		// GstMessage* gst_message_new_application (GstObject *src,  GstStructure *structure);
		this(cast(GstMessage*)gst_message_new_application((src is null) ? null : src.getObjectGstStruct(), (structure is null) ? null : structure.getStructureStruct()) );
	}
	
	/**
	 * Create a clock provide message. This message is posted whenever an
	 * element is ready to provide a clock or lost its ability to provide
	 * a clock (maybe because it paused or became EOS).
	 * This message is mainly used internally to manage the clock
	 * selection.
	 * src:
	 *  The object originating the message.
	 * clock:
	 *  The clock it provides
	 * ready:
	 *  TRUE if the sender can provide a clock
	 * Returns:
	 *  The new provide clock message.
	 * MT safe.
	 */
	public this (ObjectGst src, Clock clock, int ready)
	{
		// GstMessage* gst_message_new_clock_provide (GstObject *src,  GstClock *clock,  gboolean ready);
		this(cast(GstMessage*)gst_message_new_clock_provide((src is null) ? null : src.getObjectGstStruct(), (clock is null) ? null : clock.getClockStruct(), ready) );
	}
	
	/**
	 * Create a clock lost message. This message is posted whenever the
	 * clock is not valid anymore.
	 * If this message is posted by the pipeline, the pipeline will
	 * select a new clock again when it goes to PLAYING. It might therefore
	 * be needed to set the pipeline to PAUSED and PLAYING again.
	 * src:
	 *  The object originating the message.
	 * clock:
	 *  the clock that was lost
	 * Returns:
	 *  The new clock lost message.
	 * MT safe.
	 */
	public this (ObjectGst src, Clock clock)
	{
		// GstMessage* gst_message_new_clock_lost (GstObject *src,  GstClock *clock);
		this(cast(GstMessage*)gst_message_new_clock_lost((src is null) ? null : src.getObjectGstStruct(), (clock is null) ? null : clock.getClockStruct()) );
	}
	
	/**
	 * Create a new custom-typed message. This can be used for anything not
	 * handled by other message-specific functions to pass a message to the
	 * app. The structure field can be NULL.
	 * type:
	 *  The GstMessageType to distinguish messages
	 * src:
	 *  The object originating the message.
	 * structure:
	 *  The structure for the message. The message will take ownership of
	 * the structure.
	 * Returns:
	 *  The new message.
	 * MT safe.
	 */
	public this (GstMessageType type, ObjectGst src, Structure structure)
	{
		// GstMessage* gst_message_new_custom (GstMessageType type,  GstObject *src,  GstStructure *structure);
		this(cast(GstMessage*)gst_message_new_custom(type, (src is null) ? null : src.getObjectGstStruct(), (structure is null) ? null : structure.getStructureStruct()) );
	}
	
	
	
	
	
	
	
	
	/**
	 * Create a state change message. This message is posted whenever an element
	 * changed its state.
	 * src:
	 *  the object originating the message
	 * oldstate:
	 *  the previous state
	 * newstate:
	 *  the new (current) state
	 * pending:
	 *  the pending (target) state
	 * Returns:
	 *  The new state change message.
	 * MT safe.
	 */
	public this (ObjectGst src, GstState oldstate, GstState newstate, GstState pending)
	{
		// GstMessage* gst_message_new_state_changed (GstObject *src,  GstState oldstate,  GstState newstate,  GstState pending);
		this(cast(GstMessage*)gst_message_new_state_changed((src is null) ? null : src.getObjectGstStruct(), oldstate, newstate, pending) );
	}
	
	/**
	 * Create a new tag message. The message will take ownership of the tag list.
	 * The message is posted by elements that discovered a new taglist.
	 * src:
	 *  The object originating the message.
	 * tag_list:
	 *  The tag list for the message.
	 * Returns:
	 *  The new tag message.
	 * MT safe.
	 */
	public this (ObjectGst src, TagList tagList)
	{
		// GstMessage* gst_message_new_tag (GstObject *src,  GstTagList *tag_list);
		this(cast(GstMessage*)gst_message_new_tag((src is null) ? null : src.getObjectGstStruct(), (tagList is null) ? null : tagList.getTagListStruct()) );
	}
	
	/**
	 * Create a new buffering message. This message can be posted by an element that
	 * needs to buffer data before it can continue processing. percent should be a
	 * value between 0 and 100. A value of 100 means that the buffering completed.
	 * When percent is < 100 the application should PAUSE a PLAYING pipeline. When
	 * percent is 100, the application can set the pipeline (back) to PLAYING.
	 * The application must be prepared to receive BUFFERING messages in the
	 * PREROLLING state and may only set the pipeline to PLAYING after receiving a
	 * message with percent set to 100, which can happen after the pipeline
	 * completed prerolling.
	 * src:
	 *  The object originating the message.
	 * percent:
	 *  The buffering percent
	 * Returns:
	 *  The new buffering message.
	 * Since 0.10.11
	 * MT safe.
	 */
	public this (ObjectGst src, int percent)
	{
		// GstMessage* gst_message_new_buffering (GstObject *src,  gint percent);
		this(cast(GstMessage*)gst_message_new_buffering((src is null) ? null : src.getObjectGstStruct(), percent) );
	}
	
	
	/**
	 * Create a new duration message. This message is posted by elements that
	 * know the duration of a stream in a specific format. This message
	 * is received by bins and is used to calculate the total duration of a
	 * pipeline. Elements may post a duration message with a duration of
	 * GST_CLOCK_TIME_NONE to indicate that the duration has changed and the
	 * cached duration should be discarded. The new duration can then be
	 * retrieved via a query.
	 * src:
	 *  The object originating the message.
	 * format:
	 *  The format of the duration
	 * duration:
	 *  The new duration
	 * Returns:
	 *  The new duration message.
	 * MT safe.
	 */
	public this (ObjectGst src, GstFormat format, long duration)
	{
		// GstMessage* gst_message_new_duration (GstObject *src,  GstFormat format,  gint64 duration);
		this(cast(GstMessage*)gst_message_new_duration((src is null) ? null : src.getObjectGstStruct(), format, duration) );
	}
	
	
	/**
	 * This message can be posted by elements when their latency requirements have
	 * changed.
	 * src:
	 *  The object originating the message.
	 * Returns:
	 *  The new latency message.
	 * MT safe.
	 * Since 0.10.12
	 */
	public this (ObjectGst src)
	{
		// GstMessage* gst_message_new_latency (GstObject *src);
		this(cast(GstMessage*)gst_message_new_latency((src is null) ? null : src.getObjectGstStruct()) );
	}
	
	/**
	 * Extracts the lost clock from the GstMessage.
	 * The clock object returned remains valid until the message is freed.
	 * MT safe.
	 * message:
	 *  A valid GstMessage of type GST_MESSAGE_CLOCK_LOST.
	 * clock:
	 *  A pointer to hold the lost clock
	 */
	public void parseClockLost(GstClock** clock)
	{
		// void gst_message_parse_clock_lost (GstMessage *message,  GstClock **clock);
		gst_message_parse_clock_lost(gstMessage, clock);
	}
	
	/**
	 * Extracts the clock and ready flag from the GstMessage.
	 * The clock object returned remains valid until the message is freed.
	 * MT safe.
	 * message:
	 *  A valid GstMessage of type GST_MESSAGE_CLOCK_PROVIDE.
	 * clock:
	 *  A pointer to hold a clock object.
	 * ready:
	 *  A pointer to hold the ready flag.
	 */
	public void parseClockProvide(GstClock** clock, int* ready)
	{
		// void gst_message_parse_clock_provide (GstMessage *message,  GstClock **clock,  gboolean *ready);
		gst_message_parse_clock_provide(gstMessage, clock, ready);
	}
	
	/**
	 * Extracts the GError and debug string from the GstMessage. The values returned
	 * in the output arguments are copies; the caller must free them when done.
	 * MT safe.
	 * message:
	 *  A valid GstMessage of type GST_MESSAGE_ERROR.
	 * gerror:
	 *  Location for the GError
	 * debug:
	 *  Location for the debug message, or NULL
	 */
	public void parseError(GError** gerror, char** dbug)
	{
		// void gst_message_parse_error (GstMessage *message,  GError **gerror,  gchar **debug);
		gst_message_parse_error(gstMessage, gerror, dbug);
	}
	
	/**
	 * Extracts the GError and debug string from the GstMessage. The values returned
	 * in the output arguments are copies; the caller must free them when done.
	 * MT safe.
	 * message:
	 *  A valid GstMessage of type GST_MESSAGE_INFO.
	 * gerror:
	 *  Location for the GError
	 * debug:
	 *  Location for the debug message, or NULL
	 * Since 0.10.12
	 */
	public void parseInfo(GError** gerror, char** dbug)
	{
		// void gst_message_parse_info (GstMessage *message,  GError **gerror,  gchar **debug);
		gst_message_parse_info(gstMessage, gerror, dbug);
	}
	
	/**
	 * Extracts the new clock from the GstMessage.
	 * The clock object returned remains valid until the message is freed.
	 * MT safe.
	 * message:
	 *  A valid GstMessage of type GST_MESSAGE_NEW_CLOCK.
	 * clock:
	 *  A pointer to hold the selected new clock
	 */
	public void parseNewClock(GstClock** clock)
	{
		// void gst_message_parse_new_clock (GstMessage *message,  GstClock **clock);
		gst_message_parse_new_clock(gstMessage, clock);
	}
	
	/**
	 * Extracts the position and format from the segment start message.
	 * MT safe.
	 * message:
	 *  A valid GstMessage of type GST_MESSAGE_SEGMENT_DONE.
	 * format:
	 *  Result location for the format, or NULL
	 * position:
	 *  Result location for the position, or NULL
	 */
	public void parseSegmentDone(GstFormat* format, long* position)
	{
		// void gst_message_parse_segment_done (GstMessage *message,  GstFormat *format,  gint64 *position);
		gst_message_parse_segment_done(gstMessage, format, position);
	}
	
	/**
	 * Extracts the position and format from the segment start message.
	 * MT safe.
	 * message:
	 *  A valid GstMessage of type GST_MESSAGE_SEGMENT_START.
	 * format:
	 *  Result location for the format, or NULL
	 * position:
	 *  Result location for the position, or NULL
	 */
	public void parseSegmentStart(GstFormat* format, long* position)
	{
		// void gst_message_parse_segment_start (GstMessage *message,  GstFormat *format,  gint64 *position);
		gst_message_parse_segment_start(gstMessage, format, position);
	}
	
	/**
	 * Extracts the old and new states from the GstMessage.
	 * MT safe.
	 * message:
	 *  a valid GstMessage of type GST_MESSAGE_STATE_CHANGED
	 * oldstate:
	 *  the previous state, or NULL
	 * newstate:
	 *  the new (current) state, or NULL
	 * pending:
	 *  the pending (target) state, or NULL
	 */
	public void parseStateChanged(GstState* oldstate, GstState* newstate, GstState* pending)
	{
		// void gst_message_parse_state_changed (GstMessage *message,  GstState *oldstate,  GstState *newstate,  GstState *pending);
		gst_message_parse_state_changed(gstMessage, oldstate, newstate, pending);
	}
	
	
	/**
	 * Extracts the buffering percent from the GstMessage. see also
	 * gst_message_new_buffering().
	 * message:
	 *  A valid GstMessage of type GST_MESSAGE_BUFFERING.
	 * percent:
	 *  Return location for the percent.
	 * Since 0.10.11
	 * MT safe.
	 */
	public void parseBuffering(int* percent)
	{
		// void gst_message_parse_buffering (GstMessage *message,  gint *percent);
		gst_message_parse_buffering(gstMessage, percent);
	}
	
	/**
	 * Extracts the GError and debug string from the GstMessage. The values returned
	 * in the output arguments are copies; the caller must free them when done.
	 * MT safe.
	 * message:
	 *  A valid GstMessage of type GST_MESSAGE_WARNING.
	 * gerror:
	 *  Location for the GError
	 * debug:
	 *  Location for the debug message, or NULL
	 */
	public void parseWarning(GError** gerror, char** dbug)
	{
		// void gst_message_parse_warning (GstMessage *message,  GError **gerror,  gchar **debug);
		gst_message_parse_warning(gstMessage, gerror, dbug);
	}
	
	/**
	 * Extracts the duration and format from the duration message. The duration
	 * might be GST_CLOCK_TIME_NONE, which indicates that the duration has
	 * changed. Applications should always use a query to retrieve the duration
	 * of a pipeline.
	 * MT safe.
	 * message:
	 *  A valid GstMessage of type GST_MESSAGE_DURATION.
	 * format:
	 *  Result location for the format, or NULL
	 * duration:
	 *  Result location for the duration, or NULL
	 */
	public void parseDuration(GstFormat* format, long* duration)
	{
		// void gst_message_parse_duration (GstMessage *message,  GstFormat *format,  gint64 *duration);
		gst_message_parse_duration(gstMessage, format, duration);
	}
	
	/**
	 * Convenience macro to increase the reference count of the message.
	 * msg:
	 *  the message to ref
	 * Returns:
	 *  msg (for convenience when doing assignments)
	 */
	public Message ref()
	{
		// GstMessage* gst_message_ref (GstMessage *msg);
		return new Message( gst_message_ref(gstMessage) );
	}
	
}
