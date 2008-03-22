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
 * inFile  = GtkSourceLanguageManager.html
 * outPack = gsv
 * outFile = SourceLanguageManager
 * strct   = GtkSourceLanguageManager
 * realStrct=
 * ctorStrct=
 * clss    = SourceLanguageManager
 * interf  = 
 * class Code: No
 * interface Code: No
 * template for:
 * extend  = 
 * implements:
 * prefixes:
 * 	- gtk_source_language_manager_
 * omit structs:
 * omit prefixes:
 * omit code:
 * omit signals:
 * imports:
 * 	- glib.ListSG
 * 	- glib.Str
 * structWrap:
 * 	- GSList* -> ListSG
 * module aliases:
 * local aliases:
 */

module gsv.SourceLanguageManager;

public  import gsvc.gsvtypes;

private import gsvc.gsv;


private import glib.ListSG;
private import glib.Str;



private import gobject.ObjectG;

/**
 * Description
 */
public class SourceLanguageManager : ObjectG
{
	
	/** the main Gtk struct */
	protected GtkSourceLanguageManager* gtkSourceLanguageManager;
	
	
	public GtkSourceLanguageManager* getSourceLanguageManagerStruct()
	{
		return gtkSourceLanguageManager;
	}
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gtkSourceLanguageManager;
	}
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GtkSourceLanguageManager* gtkSourceLanguageManager)
	{
		if(gtkSourceLanguageManager is null)
		{
			this = null;
			version(Exceptions) throw new Exception("Null gtkSourceLanguageManager passed to constructor.");
			else return;
		}
		super(cast(GObject*)gtkSourceLanguageManager);
		this.gtkSourceLanguageManager = gtkSourceLanguageManager;
	}
	
	/**
	 */
	
	/**
	 * Creates a new language manager. If you do not need more than one language
	 * manager or a private language manager instance then use
	 * gtk_source_language_manager_get_default() instead.
	 */
	public this ()
	{
		// GtkSourceLanguageManager* gtk_source_language_manager_new  (void);
		auto p = gtk_source_language_manager_new();
		if(p is null)
		{
			this = null;
			version(Exceptions) throw new Exception("Construction failure.");
			else return;
		}
		this(cast(GtkSourceLanguageManager*) p);
	}
	
	/**
	 * Returns the default GtkSourceLanguageManager instance.
	 * Returns: a GtkSourceLanguageManager. Return value is ownedby GtkSourceView library and must not be unref'ed.
	 */
	public static GtkSourceLanguageManager* getDefault()
	{
		// GtkSourceLanguageManager* gtk_source_language_manager_get_default  (void);
		return gtk_source_language_manager_get_default();
	}
	
	/**
	 * Sets the list of directories where the lm looks for
	 * language files.
	 * If dirs is NULL, the search path is reset to default.
	 * Note
	 *  At the moment this function can be called only before the
	 *  language files are loaded for the first time. In practice
	 *  to set a custom search path for a GtkSourceLanguageManager,
	 *  you have to call this function right after creating it.
	 * Params:
	 * dirs =  a NULL-terminated array of strings or NULL.
	 */
	public void setSearchPath(char** dirs)
	{
		// void gtk_source_language_manager_set_search_path  (GtkSourceLanguageManager *lm,  gchar **dirs);
		gtk_source_language_manager_set_search_path(gtkSourceLanguageManager, dirs);
	}
	
	/**
	 * Gets the list directories where lm looks for language files.
	 * Returns: NULL-terminated array containg a list of language files directories.The array is owned by lm and must not be modified.
	 */
	public char** getSearchPath()
	{
		// const gchar* const * gtk_source_language_manager_get_search_path  (GtkSourceLanguageManager *lm);
		return gtk_source_language_manager_get_search_path(gtkSourceLanguageManager);
	}
	
	/**
	 * Returns the ids of the available languages.
	 * Returns: a NULL-terminated array of string containing the ids of theavailable languages or NULL if no language is available. The arrayis owned by lm and must not be modified.
	 */
	public char** getLanguageIds()
	{
		// const gchar* const * gtk_source_language_manager_get_language_ids  (GtkSourceLanguageManager *lm);
		return gtk_source_language_manager_get_language_ids(gtkSourceLanguageManager);
	}
	
	/**
	 * Gets the GtkSourceLanguage identified by the given id in the language
	 * manager.
	 * Params:
	 * id =  a language id.
	 * Returns: a GtkSourceLanguage, or NULL if there is no languageidentified by the given id. Return value is owned by lm and should notbe freed.
	 */
	public GtkSourceLanguage* getLanguage(char[] id)
	{
		// GtkSourceLanguage* gtk_source_language_manager_get_language  (GtkSourceLanguageManager *lm,  const gchar *id);
		return gtk_source_language_manager_get_language(gtkSourceLanguageManager, Str.toStringz(id));
	}
}